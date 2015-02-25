class EventsController < ApplicationController

	def home
		@events = Event.search(params[:search])
	end

	def results
		# @events = Event.all
		# @city = params[:city]
		# @results = @events.search(@city)
		# @events = Event.all
		# @results = @events.find(1)
		@city = params[:city]
		@search = Event.search(@city)
		@results = @search.order(date: :asc)

		render 'search_show'
		

	end

	def new
		@event = Event.new
		render 'new'
	end

	def create
		@event = Event.new event_params
		if @event.save
			flash[:notice] = "Event created succesfully"
			redirect_to(event_path(@event))
		else
			flash[:error] = "Event not created"
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	# def search
	#   # @event = Event.search params[:search]
	#   render 'search'
	# end

	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :time, :venue, :city, :ticket)
		end

end

