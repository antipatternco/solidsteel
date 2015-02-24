class Mix < ActiveRecord::Base

	belongs_to :broadcast

	has_many :tracks

	def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :name, :presence => true
end
