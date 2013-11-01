class HomeController < ApplicationController
  before_filter :authenticate_user!, :before_query
	
	def index
		@events = Event.paginate(page: params[:page], per_page: 10)
	end

	private

	def before_query

	end

end