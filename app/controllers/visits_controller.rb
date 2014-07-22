class VisitsController < ApplicationController

  def index
    loc=Location.find(params[:location_id])
    @visits=loc.visits.where(:from_date => DateTime.now.beginning_of_month..DateTime.now.end_of_month)

  end

  def show
        @visit=Visit.find(params[:id])
  end
end
