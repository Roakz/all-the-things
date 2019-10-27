class UserProfilesController < ApplicationController

  def show
  end

  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile = current_user.update_user_profile(profile_params)
    @user_profile = current_user.user_profile.image.attach(:profile_image)
  end

  def destroy
  end

  private 
  def profile_params
  params.require(:user_profile).permit(:name, :content, :profile_image)
  end
  
end


