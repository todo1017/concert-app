class EventsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@events = Event.paginate(page: params[:page], per_page: 10)
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.find(params[:id])
	end

	def create
		event = Event.new(params[:event])

    if event.save
      redirect_to(events_path, notice: "New event is successfully created.")
    else
      redirect_to(events_path, notice: "Failed to create new event.")
    end
	end

	def destroy
		event = Event.find(params[:id])
		if event.destroy
			redirect_to(events_path, notice: "The Event is deleted successfully")
		else
			redirect_to(events_path, notice: "Failed to delete the event")
		end
	end

	def update
		event = Event.find(params[:event])
		if event.update_attribute_params(params[:event])
			redirect_to(events_path, notice: "The event is updated successfully")
		else
			redirect_to(events_path, notice: "Failed to update the event")
		end
	end

end
