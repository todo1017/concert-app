class ArtistsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@artists = Artist.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.find(params[:id])
	end

	def create
		artist = Artist.new(params[:artist])

    if artist.save
      redirect_to(artists_path, notice: "New artist is successfully created.")
    else
      redirect_to(artists_path, notice: "Failed to create new artist.")
    end
	end

	def destroy
		artist = Artist.find(params[:id])
		if artist.destroy
			redirect_to(groups_path, notice: "The Artist is deleted successfully")
		else
			redirect_to(groups_path, notice: "Failed to delete the artist")
		end
	end

	def update
		event = Event.find(params[:event])
		if event.update_attribute_params(params[:event])
			redirect_to(groups_path, notice: "The event is updated successfully")
		else
			redirect_to(groups_path, notice: "Failed to update the event")
		end
	end
end
