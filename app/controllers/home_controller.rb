class HomeController < ApplicationController
  before_filter :authenticate_user!, :before_query
	
	def index
		if current_user.has_role? :admin
			@artists = Artist.all

			# if user has admin role, show all events
			unless params[:artist].nil? or params[:artist] == ""
				if params[:date] == "0" # past
					@events = Event.past.by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				elsif params[:date] == "1"
					@events = Event.upcoming.by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				else
					@events = Event.by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				end
			else
				if params[:date] == "0" # past
					@events = Event.past.paginate(page: params[:page], per_page: 10)
				elsif params[:date] == "1"
					@events = Event.upcoming.paginate(page: params[:page], per_page: 10)
				else
					@events = Event.paginate(page: params[:page], per_page: 10)
				end
			end

		elsif current_user.has_role? :provider
			@artists = Artist.joins(:events).where(events: { school_email: current_user.email })

			# if user is school contractor, show own events
			unless params[:artist].nil? or params[:artist] == ""
				if params[:date] == "0" # past
					@events = Event.where(school_email: current_user.email).past.by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				elsif params[:date] == "1"
					@events = Event.where(school_email: current_user.email).upcoming.by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				else
					@events = Event.where(school_email: current_user.email).by_artist(params[:artist]).paginate(page: params[:page], per_page: 10)
				end
			else
				if params[:date] == "0" # past
					@events = Event.where(school_email: current_user.email).past.paginate(page: params[:page], per_page: 10)
				elsif params[:date] == "1"
					@events = Event.where(school_email: current_user.email).upcoming.paginate(page: params[:page], per_page: 10)
				else
					@events = Event.where(school_email: current_user.email).paginate(page: params[:page], per_page: 10)
				end
			end

		end

	end

	private

	def before_query

	end

end