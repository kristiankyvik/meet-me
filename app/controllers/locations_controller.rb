class LocationsController < ApplicationController

	def index
		@locations=Location.last(10)
		render 'index'
	end

	def create
		Location.create(name: params[:location][:name], city:params[:location][:city] )
		redirect_to root_url
	end

	def show
		@location=Location.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		render '404' , status: 404
	end

end
