class SongkickArtist < ActiveRecord::Base
	require 'songkickr'
	attr_accessor :exist


	def self.find_artists(songkick_events)
		songkick_events.each do |event|
			#event title
				if event.display_name == nil
					@title = "Unknown"
				else
					@title = event.display_name
				end

			#artist
				@performers = event.performances.map do |artist|
					artist.display_name
				end
				@artist = @performers.join(", ")

			#date & time
				if event.start == nil
					@date = "Unknown"
				else
					@date = event.start
				end

			#web link
				if event.uri == nil
					@link = "http://www.songkick.com/search?utf8=%E2%9C%93&type=initial&query=" + event.display_name
				else
					@link = event.uri
				end

			#venue
				if event.venue.display_name == nil
					@venue = "Unknown"
				else
					@venue = event.venue.display_name
				end

			#location
				if event.location.city == nil
					@city = "Unknown"
				else
					@city = event.location.city
				end

			#description
				if event.venue.description == nil
					@text = "An awesome " +event.type+ "."
				else
					@text = event.venue.description
				end

			create_event(@title, @artist, @text, @date, @venue, @city, @link)
		end
	end

	@exist = []
	def self.create_event(title, artist, text, date, venue, city, link)
		if Event.exists?(['title ILIKE :title', title: "%#{title}%"]) && Event.exists?(date: date)
			@exist.push(title)
		else
			Event.create(title: (@title), artist: (@artist), description: (@text), date: (@date), time: (@date), venue: (@venue), city: (@city), ticket: (@link))
		end	
	end

	def self.record_found
		@exist		
	end


end







