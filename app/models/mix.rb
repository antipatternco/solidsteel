class Mix < ActiveRecord::Base

	def self.get_latest
		self.order("broadcast_date DESC").first
	end
	
	validates :url, :presence => true

end
