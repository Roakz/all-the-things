class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authorise

  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:alert] = "User deleted"

    redirect_to users_path
  end

  private

  def authorise
  
    return if User.admin_check(current_user)

    flash[:alert] = "Sorry! that dashboard is only available to admins."
    
    redirect_to user_profile_path(current_user.id)
  
  end

end
