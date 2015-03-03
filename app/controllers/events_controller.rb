class EventsController < ApplicationController

	def home
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
		# binding.pry
		if @exist == "yes" 
			flash[:found] = "Event already exist in database."
			redirect_to(new_event_path)
		else
			if @event.save
				flash[:notice] = "Event created succesfully"
				redirect_to(event_path(@event))
			else
				flash[:alert] = "Event not created"
				render 'new'
			end
		end
	end

	def show
		@event = Event.find(params[:id])
		@posts = Post.where(event_id: "#{@event.id}")
		binding.pry
	end

	def location
		@city = params[:city]
		@events = Event.all
		@location_month_events = @events.location_events(@city)
		# @location_month_events.where(date: (date.beginning_of_day..date.end_of_day))
		render json: @location_month_events
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:notice] = "Event updated succesfully"
			redirect_to action: 'show', controller: 'events', id: @event.id
		else
			flash[:alert] = "Event not updated"
			render 'edit'
		end
	end







	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :artist, :time, :venue, :city, :ticket)
		end

end

