class EventsController < ApplicationController

	def index
		render 'index'
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
			render "new"
		end
	end



	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :time, :venue, :city, :ticket)
		end

end

