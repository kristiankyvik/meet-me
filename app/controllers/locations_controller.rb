class LocationsController < ApplicationController

	def index
		@locations = Location.last(10)

    @location = Location.new
    @location.comments.build

		render 'index'
	end

	def create
		@location = Location.new(location_params)
    	@location.save

		redirect_to root_url
	end

	def show
		@location = Location.find(params[:id])
		@users=User.all
		
		rescue ActiveRecord::RecordNotFound
		render '404' , status: 404
	end

	def destroy
		Location.destroy(params[:id])
		redirect_to( action: 'index', controller: 'locations', location_id: params[:id])
	end

	def edit
		@location = Location.find(params[:id])
		render 'edit'
	end

	def update
		@location = Location.find(params[:id])
		
		@location.update_attributes visit_params
	    if @location.save
	      redirect_to( action: 'index')
	    else
	      render 'edit'
	    end 
	end

	  private
    def visit_params
        params.require(:location).permit(:name, :city, :avatar, comments_attributes: [:id, :comment_text, :_destroy])
    end

    def location_params
        params.require(:location).permit(:name, :city, :avatar, comments_attributes: [:id, :comment_text, :_destroy])
    end
end
