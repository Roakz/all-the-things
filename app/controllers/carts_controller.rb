class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorise


  def show
    @user = User.find(params[:user_id])
    @cart_item = CartItem.new
  end

  private

  def authorise

    return if params[:user_id].to_i == current_user.id

    flash[:alert] = "soz...you are only authorised to view your own cart :("
    
    redirect_to user_cart_path(current_user.id)

  end


end
