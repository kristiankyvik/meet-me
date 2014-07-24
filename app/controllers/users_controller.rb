class UsersController < ApplicationController
  def index
    @users=User.all
    
  end

  def show
    @user = User.find(params[:id])
    @visits = Visit.where(:user_id => params[:id],:from_date => DateTime.now.beginning_of_month..DateTime.now.end_of_month)
  end
end
