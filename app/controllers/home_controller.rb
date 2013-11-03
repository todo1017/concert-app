class HomeController < ApplicationController
  before_filter :authenticate_user!, :before_query
	
	def index
		if current_user.has_role? :admin
			@artists = Artist.all
		else
			@artists = current_user.artists
		end

		unless params[:artist].nil?
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
	end

	private

	def before_query

	end

end