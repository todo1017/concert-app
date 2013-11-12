class ArtistsController < ApplicationController
	before_filter :authenticate_user!

	def index
		if params[:query].nil?
			@artists = Artist.paginate(page: params[:page], per_page: 10)
		else
			@artists = Artist.by_name(params[:query]).paginate(page: params[:page], per_page: 10)
		end
	end

	def show
		@artist = Artist.find(params[:id])
		@events = @artist.events.paginate(page: params[:page], per_page: 10)
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def create
		artist = Artist.new(params[:artist])
		artist.user_id = current_user.id
    if artist.save
      redirect_to(artists_path, notice: "New artist is successfully created.")
    else
      redirect_to(artists_path, notice: "Failed to create new artist.")
    end
	end

	def destroy
		artist = Artist.find(params[:id])
		if artist.destroy
			redirect_to(artists_path, notice: "The Artist is deleted successfully")
		else
			redirect_to(artists_path, notice: "Failed to delete the artist")
		end
	end

	def update
		artist = Artist.find(params[:id])
		if artist.update_attributes(params[:artist])
			redirect_to(artists_path, notice: "Your artist is updated successfully")
		else
			redirect_to(artists_path, notice: "Failed to update the event")
		end
	end
end
