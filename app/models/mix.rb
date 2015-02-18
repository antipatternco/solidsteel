class Mix < ActiveRecord::Base

	belongs_to :broadcast

	def self.get_latest
		self.order("broadcast_date DESC").first
	end
	
	validates :url, :presence => true

end
