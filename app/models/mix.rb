class Mix < ActiveRecord::Base

	before_save :extract_soundcloud_id

	belongs_to :broadcast

	has_many :tracks

	def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :name, :presence => true

	has_attached_file :background_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :background_image, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :mix_image, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "/images/ss_100_x_100.jpg"
  	validates_attachment_content_type :mix_image, :content_type => /\Aimage\/.*\Z/

  	def extract_soundcloud_id
		#self.soundcloudId = DateTime.now
	end
end
