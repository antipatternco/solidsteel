class Broadcast < ActiveRecord::Base
  before_save :set_tags

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :processed_session_name

  has_many :mixes

  default_scope { order('broadcast_date DESC') } 

  scope :contains, -> (session_name) { where("session_name REGEXP '[[:<:]]#{session_name}[[:>:]]'") }

  scope :year, -> (year) { where(" EXTRACT(YEAR FROM broadcast_date) = ? ", year ) if year.present? }

  scope :featured, -> { where(featured: true) }

  def self.get_latest
	  self.order("broadcast_date DESC").first
  end

  def set_tags
    self.tag_list = self.session_name
  end

	validates :session_name, :broadcast_date, :presence => true

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/ss_broadcast.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :mixes, allow_destroy: true
end
