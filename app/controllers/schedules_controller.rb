class SchedulesController < ApplicationController
	
	def index
		if params[:artist].nil? || params[:artist] == ""
			@events = Event.where({school_email: current_user.email})
						.paginate(page: params[:page], per_page: 10)
		else
			@events = Event.by_artist(params[:artist]).where({school_email: current_user.email})
						.paginate(page: params[:page], per_page: 10)
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		puts "#{event.performance_date} #{params[:show_time]}"
		performance_time = DateTime.strptime("#{event.performance_date} #{params[:event][:show_time]}", "%F %H:%M")

		event.performance_time = performance_time unless event.nil?
		if event.update_attributes(params[:event])
			redirect_to(schedules_path, notice: "You scheduled the event successfully")
		else
			redirect_to(schedules_path, notice: "Failed to schedule event")
		end
	end
end