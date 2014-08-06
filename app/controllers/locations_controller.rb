# require 'devise'
require 'pry'

class LocationsController < ApplicationController

	def index
    if user_signed_in?
      visits = current_user.visits
      ids = visits.map{ |visit| visit.location_id}.uniq
      @locations = Location.where(location_id: ids)
    else
      @locations =  Location.last(10)
    end
		render 'index'
	end

  def new
    @location = Location.new()
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
	      redirect_to root_url
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
