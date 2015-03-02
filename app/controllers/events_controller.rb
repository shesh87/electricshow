class EventsController < ApplicationController

	def home
		# @events = Event.search(params[:title], params[:artist], params[:date], params[:city], params[:venue])
	end

	def results
		@title = params[:title]
		@artist = params[:artist]
		@date = params[:date]
		@city = params[:city]
		@venue = params[:venue]
		@search = Event.search(@title, @artist, @date, @city, @venue)
		
		if @search.empty?
			flash[:nothing] = "Sorry, nothing in the database matched your search fields."
			render 'home'
		else
			@results = @search.order(date: :asc)
			render 'results'
		end
	end

	def new
		@event = Event.new
		render 'new'
	end

	def create
		@event = Event.new event_params
		title = @event.title
		date = @event.date
		@exist = Event.event_exists(title, date)
		binding.pry
		if @exist == "yes" 
			flash[:found] = "Event already exist in database."
			redirect_to(new_event_path)
		else
			if @event.save
				flash[:notice] = "Event created succesfully"
				redirect_to(event_path(@event))
			else
				flash[:error] = "Event not created"
				render 'new'
			end
		end
	end

	def show
		@event = Event.find(params[:id])
	end






	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :artist, :time, :venue, :city, :ticket)
		end

end

