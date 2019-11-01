class CartsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @cart_item = CartItem.new
  end

end
