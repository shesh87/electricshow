class SongkickArtistsController < ApplicationController


	def admin
		render 'home'
	end

	def new
		render 'new'
	end

	def create
		@artist = params[:artist]
		
		remote = Songkickr::Remote.new 
		results_object = remote.events(:artist_name => @artist)
		@songkick_events = results_object.results
		@new_artist = SongkickArtist.all
		@results = @new_artist.find_artists(@songkick_events)

		# binding.pry
		redirect_to(index_path)
	end

	def index
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
