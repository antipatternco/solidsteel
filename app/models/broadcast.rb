require 'roo'
require 'soundcloud'

class Broadcast < ActiveRecord::Base
  before_save :set_tags
  after_save :get_soundcloud_data

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  has_many :mixes, dependent: :destroy

  scope :contains, -> (session_name) { where("session_name REGEXP '[[:<:]]#{session_name}[[:>:]]'").order("broadcast_date DESC") }

  scope :year, -> (year) { where(" EXTRACT(YEAR FROM broadcast_date) = ? ", year ).order("broadcast_date DESC") if year.present? }

  scope :featured, -> { where(featured: true) }

  scope :highlights, -> { where(highlight: true) }

  def get_soundcloud_data
    delay.get_downloadlink_and_canonical_link
  end

  def get_downloadlink_and_canonical_link
    client = Soundcloud.new(:client_id => 'ab4a60b41abdd45663bc085f22134d4f')
    self.mixes.each do |mix|
      if mix.soundcloudId && mix.soundcloudId != ''
        track = client.get("/tracks/#{mix.soundcloudId}")
        permalink = track.permalink_url
        downloadlink = track.download_url
        playbackcount = track.playback_count
        if permalink
          mix.update_column(:permalink, permalink)
        end
        if downloadlink
          if track.downloadable
            mix.update_column(:downloadlink, downloadlink)
          end
        end
        if playbackcount
          mix.update_column(:playbackcount, playbackcount)
        end
      end
    end
  end

  def self.get_latest
	  self.order("broadcast_date DESC").first
  end

  def set_tags
    self.tag_list = self.session_name
  end

	validates :session_name, :broadcast_date, :presence => true

	has_attached_file :image, :styles => { :thumb => "60x60>" }, :default_url => "/images/:style/ss-broadcast-default-80.gif"

  has_attached_file :background_image, :styles => { :small => "200x125>" }, :default_url => "/images/:style/ss_broadcast_bg.png"
  def background_image_thumb_url
    background_image.url(:small)
  end

  has_attached_file :spreadsheet

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :background_image, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :mixes, allow_destroy: true

  def sheet_to_show
    spreadsheet = Roo::Excel.new("#{self.spreadsheet.queued_for_write[:original].path}", file_warning: :ignore)

    # SETUP
    sheet = spreadsheet.sheet(0)
    broadcast_date = sheet.row(1)[2]
    session_name = sheet.row(1)[4]
    row_start = sheet.first_row
    row_stop = sheet.last_row
    currentRow = 0
    part1tracks = []
    part2tracks = []
    part3tracks = []
    part4tracks = []
    part1row = part2row = part3row = part4row = nil

    # CHECK WHERE EACH PART STARTS
    (1..row_stop).each do |i|
      currentCell = sheet.cell(i, 1);
      next if currentCell.nil?
      if currentCell.include? "PART 1"
          part1row = i
      elsif currentCell.include? "PART 2"
          part2row = i
      elsif currentCell.include? "PART 3"
          part3row = i
      elsif currentCell.include? "PART 4"
          part4row = i
      end
    end

    # CREATE TRACKS FOR EACH ROW
    (part1row+1..part2row-1).each do |row|
       next if sheet.row(row)[1].nil?
       part1tracks.push(Track.new({
          artist: sheet.row(row)[0],
          title: sheet.row(row)[1],
          composed: sheet.row(row)[2],
          published: sheet.row(row)[3],
          record_label: sheet.row(row)[4],
          catalogue_no: sheet.row(row)[5],
          duration: sheet.row(row)[6]
        }))
    end

    (part2row+2..part3row-1).each do |row|
       next if sheet.row(row)[0].nil?
       part2tracks.push(Track.new({
        artist: sheet.row(row)[0],
        title: sheet.row(row)[1],
        composed: sheet.row(row)[2],
        published: sheet.row(row)[3],
        record_label: sheet.row(row)[4],
        catalogue_no: sheet.row(row)[5],
        duration: sheet.row(row)[6]
        }))
    end

    (part3row+1..part4row-1).each do |row|
       next if sheet.row(row)[0].nil?
       part3tracks.push(Track.new({
        artist: sheet.row(row)[0],
        title: sheet.row(row)[1],
        composed: sheet.row(row)[2],
        published: sheet.row(row)[3],
        record_label: sheet.row(row)[4],
        catalogue_no: sheet.row(row)[5],
        duration: sheet.row(row)[6]
        }))
    end

    (part4row+1..sheet.last_row).each do |row|
       next if sheet.row(row)[0].nil?
       part4tracks.push(Track.new({
        artist: sheet.row(row)[0],
        title: sheet.row(row)[1],
        composed: sheet.row(row)[2],
        published: sheet.row(row)[3],
        record_label: sheet.row(row)[4],
        catalogue_no: sheet.row(row)[5],
        duration: sheet.row(row)[6]
      }))
    end

    # CREATE MIXES FOR EACH PART (1+2 AND 3+4)
    if part1tracks.length && part2tracks.length && part3tracks.length && part4tracks.length
        mix1 = Mix.new({
          name: "#{sheet.cell(part1row, 2)}, #{sheet.cell(part2row, 2)}",
          part: 1
        })
        part1tracks.each do |track|
          mix1.tracks << track
        end
        part2tracks.each do |track|
          mix1.tracks << track
        end

        mix2 = Mix.new({
          name: "#{sheet.cell(part3row, 2)}, #{sheet.cell(part4row, 2)}",
          part: 2
        })
        part3tracks.each do |track|
          mix2.tracks << track
        end
        part4tracks.each do |track|
          mix2.tracks << track
        end

    elsif part1tracks.length && part2tracks.length && part3tracks.length
        mix1 = Mix.new({
          name: "#{sheet.cell(part1row, 2)}, #{sheet.cell(part2row, 2)}",
          part: 1
          })
        part1tracks.each do |track|
          mix1.tracks << track
        end
        part2tracks.each do |track|
          mix1.tracks << track
        end

        mix2 = Mix.new({
          name: "#{sheet.cell(part3row, 2)}",
          part: 2
        })
        mix2.tracks << part3tracks

    elsif part1tracks.length && part2tracks.length
        mix1 = Mix.new({
          name: "#{sheet.cell(part1row, 2)}",
          part: 1
        })
        part1tracks.each do |track|
          mix1.tracks << track
        end

        mix2 = Mix.new({
          name: "#{sheet.cell(part2row, 2)}",
          part: 2
        })
        part2tracks.each do |track|
          mix2.tracks << track
        end

    elsif part1tracks.length
        mix1 = Mix.new({
          name: "#{sheet.cell(part1row, 2)}",
          part: 1
        })
        part1tracks.each do |track|
          mix1.tracks << track
        end
    end

    # set broadcast name
    self.broadcast_date = broadcast_date
    self.session_name = session_name

    if mix1
      self.mixes << mix1
    end
    if mix2
      self.mixes << mix2
    end

    if self.save
      return true
    else
      return false
    end
  end
end
