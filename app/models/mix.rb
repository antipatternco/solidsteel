class Mix < ActiveRecord::Base

	before_save :extract_soundcloud_id

	belongs_to :broadcast

	has_many :tracks, dependent: :destroy

	def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :name, :presence => true

	has_attached_file :background_image, :styles => { :medium => "720x" }, :default_url => "/images/:style/ss-mix-default-bg-1400.jpg"
  	validates_attachment_content_type :background_image, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :mix_image, :styles => { :thumb => "60x" }, :default_url => "/images/:style/ss_120_x_120.gif"
  	validates_attachment_content_type :mix_image, :content_type => /\Aimage\/.*\Z/

  	def extract_soundcloud_id
  		#puts self.soundcloudId
		if self.soundcloudId
            if self.soundcloudId[/.*tracks\/(\d*)[&|%]/,1]
            	self.soundcloudId = self.soundcloudId[/.*tracks\/(\d*)[&|%]/,1]
            elsif self.soundcloudId[/.*tracks%2F(\d*)[&|%]/,1]
            	self.soundcloudId = self.soundcloudId[/.*tracks%2F(\d*)[&|%]/,1]
            end
        end
	end
end
