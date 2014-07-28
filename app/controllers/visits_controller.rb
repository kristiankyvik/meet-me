class VisitsController < ApplicationController

  def index
      @visits = User.find(params[:user_id]).visits.last(10)
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @location = Location.find(params[:location_id])
    @visit = Visit.new()
    @users =User.all
    render "new"
  end

  def create
    @location = Location.find(params[:location_id])
    @visit = @location.visits.new( visit_params )
    @users =User.all
    # render plain: params.inspect
    if @visit.save
      flash[:message] = "Action has been succesfull!"
      redirect_to( action: 'index', controller: 'visits', location_id: @location.id)
    else
      render 'new'
    end 
  end

  def destroy
    Visit.destroy(params[:id])
    redirect_to( action: 'index', controller: 'visits', location_id: params[:location_id])
  end

  def edit
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
    render "edit"
  end

  def update
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
    @visit.update_attributes( visit_params )
    if @visit.save
      redirect_to( action: 'index', controller: 'visits', location_id: @location.id)
    else
      render 'edit'
    end 
  end

  private
    def visit_params
        params.require(:visit).permit(:to_date, :from_date, :user_id)
    end
end
