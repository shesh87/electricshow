class Event < ActiveRecord::Base
	require 'songkickr'
	
	has_and_belongs_to_many :artists


	validates :title, presence: true
	validates :title, format: {with: /\w/}
	validates :artist, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :venue, presence: true
	validates :venue, format: {with: /\w/}
	validates :city, presence: true
	validates :city, format: {with: /\w/}
	validates :ticket, presence: true
	

	def self.search(title, artist, date, city, venue)
		query = self
		query = query.where('title ILIKE :title', title: "%#{title}%") if title.present?
		query = query.where('artist ILIKE :artist', artist: "%#{artist}%") if artist.present?
		query = query.where(date: "#{date}") if date.present?
		query = query.where('city ILIKE :city', city: "%#{city}%") if city.present?
		query = query.where('venue ILIKE :venue', venue: "%#{venue}%") if venue.present?
		return query
	end


	def self.event_exists(title, date)
		if Event.exists?(['title ILIKE :title', title: "%#{title}%"]) && Event.exists?(date: date)
			return "yes"
		else
			return "no"
		end
	end

	def self.location_events(city)
		date = Time.now
		where('city ILIKE :city', city: "%#{city}%").where(date: (Time.now.midnight..date.end_of_month)).limit(10).order(date: :asc)
		# binding.pry
	end


end













