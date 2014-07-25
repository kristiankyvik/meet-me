class UsersController < ApplicationController
  def index
    @users=User.all
    
  end

  def show
    @user = User.find(params[:id])
    @visits = Visit.where(:user_id => params[:id],:from_date => DateTime.now.beginning_of_month..DateTime.now.end_of_month)
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def update
  	@user = User.find(params[:id])
  			
  	@user.update_attributes user_params
  	if @user.save
  	    redirect_to( action: 'index')
  	else
  	    render 'edit'
  	end
  end

  private

  def user_params
  	params.require(:user_name).permit(:name, :nationality)
  end
end
