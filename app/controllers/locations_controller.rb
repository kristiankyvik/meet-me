class LocationsController < ApplicationController

	def index
		@locations = Location.last(10)
		render 'index'
	end

	def create
		Location.create(name: params[:location][:name], city:params[:location][:city], avatar: params[:location][:avatar] )
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
        params.require(:location).permit(:name, :city, :avatar)
    end

end
