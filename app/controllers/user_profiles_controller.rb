class UserProfilesController < ApplicationController

  def show
    @model = current_user.user_profile
  end

  def edit
    @user_profile = current_user.user_profile
  end

  # fix me!!
  def update
    @user_profile = current_user.user_profile.update(profile_params)
    @user_profile = current_user.user_profile.profile_image.attach(profile_params[:profile_image])
    redirect_to user_profile_path(current_user)
  end

  def destroy
  end

  private 
  def profile_params
  params.require(:user_profile).permit(:name, :content, :profile_image)
  end
  
end


