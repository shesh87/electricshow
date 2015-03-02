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

		redirect_to(index_path)
		binding.pry
		if @results.empty? == false
			flash[:sucess] = "Artist events added succesfully"
			redirect_to(event_path(@event))
		else
			flash[:error] = "Event not created"
			render 'new'
		end
	end

	def index
		new_artist = SongkickArtist.all
		@exist = new_artist.record_found
		render 'index'
	end


		# if artist added to database?
		# 	flash[:error] = "Sorry, artist not added."
		# 	render 'new'
		# else
		# 	flash[:sucess] = "Artisted added to database."
		# 	render 'new'
		# end


	private
		def artist_params
			params.require(:songkick_artist).permit(:artist)
		end


end
