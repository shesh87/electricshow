class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :title, format: {with: /\w/}
	# validates :artist, presence: true
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
	

	def self.search(search)
		@city = search
		where('city ILIKE :city', city: @city)
	end



end
