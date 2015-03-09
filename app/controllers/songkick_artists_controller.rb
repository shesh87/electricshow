class SongkickArtistsController < ApplicationController


	def admin
		render 'home'
	end

	def new
		render 'new'
	end

	def create
		artist = params[:artist]
		remote = Songkickr::Remote.new Rails.configuration.x.songkick.api_key
		results_object = remote.events(:artist_name => artist)
		songkick_events = results_object.results
		
		new_artist = SongkickArtist.all
		new_artist.find_artists(songkick_events)
		@exist = new_artist.record_found
		@results = new_artist.events_added

		render 'index'
	end

	# def index
		
	# end






	private
		def artist_params
			params.require(:songkick_artist).permit(:artist)
		end


end
