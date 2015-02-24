class Track < ActiveRecord::Base
	belongs_to :mix

	validates :title, :artist, :presence => true
end
