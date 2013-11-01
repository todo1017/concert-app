class SchedulesController < ApplicationController
	
	def index
		@events = Event.where({school_email: current_user.email}).paginate(page: params[:page], per_page: 10)
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		if event.update_attributes(params[:event])
			redirect_to(schedules_path, notice: "You scheduled the event successfully")
		else
			redirect_to(schedules_path, notice: "Failed to schedule event")
		end
	end
end