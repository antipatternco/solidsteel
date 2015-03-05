class Broadcast < ActiveRecord::Base
    has_many :mixes

    scope :contains, -> (session_name) { where("session_name like ?", "#{session_name}%") }

    scope :year, -> (year) { where(" EXTRACT(YEAR FROM broadcast_date) = ? ", year ) if year.present? }

    def self.get_latest
		self.order("broadcast_date DESC").first
	end

	validates :session_name, :broadcast_date, :presence => true
end
