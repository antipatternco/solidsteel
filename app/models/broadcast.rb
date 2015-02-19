class Broadcast < ActiveRecord::Base
    has_many :mixes

    def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :session_name, :broadcast_date, :presence => true
end
