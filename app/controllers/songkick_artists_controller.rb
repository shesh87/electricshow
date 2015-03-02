class SongkickArtistsController < ApplicationController


	def admin
		render 'home'
	end

	def new
		render 'new'
	end

	def create
		artist = params[:artist]
		remote = Songkickr::Remote.new ''
		results_object = remote.events(:artist_name => artist)
		songkick_events = results_object.results
		
		new_artist = SongkickArtist.all
		@results = new_artist.find_artists(songkick_events)
		@exist = new_artist.record_found
		if @exist.empty? == false
			render 'index'
		else
			flash[:success] = "Artist events added succesfully"
			redirect_to(admin_songkick_artists_new_path)
		end
	end






	private
		def artist_params
			params.require(:songkick_artist).permit(:artist)
		end


end
