class SongkickArtistsController < ApplicationController


	def admin
		render 'home'
	end

	def new
		# @event = Event.new
		# render 'admin'
		render 'new'
	end

	def create
		# @event = Event.new artist_params
		# if @event.save
		# 	flash[:notice] = "Event created succesfully"
		# 	redirect_to(event_path(@event))
		# else
		# 	flash[:error] = "Event not created"
		# 	render 'new'
		# end
		@artist = params[:artist]
		binding.pry
	end





	private
		def artist_params
			params.require(:songkick_artist).permit(:artist)
		end


end
