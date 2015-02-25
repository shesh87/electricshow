class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :title, format: {with: /\w/}
	validates :artist, presence: true
	# validates :artist, format: {with: /\w/}
	validates :description, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :venue, presence: true
	validates :venue, format: {with: /\w/}
	validates :city, presence: true
	validates :city, format: {with: /\w/}
	validates :ticket, presence: true
	validates :ticket, presence: true
	

	def self.search(title, artist, date, city, venue)
		@title = title
		where('title ILIKE :title', title: @title)

		@artist = artist
		where('artist ILIKE :artist', artist: @artist)

		@date = date
		where('date ILIKE :date', date: @date)

		@city = city
		where('city ILIKE :city', city: @city)
		
		@venue = venue
		where('venue ILIKE :venue', venue: @venue)
	end



end
