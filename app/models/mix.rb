class Mix < ActiveRecord::Base

	before_save :extract_soundcloud_id

	belongs_to :broadcast

	has_many :tracks

	def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :name, :presence => true

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	def extract_soundcloud_id
		#self.soundcloudId = DateTime.now
	end
end
