class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
  @item = Item.find(cart_item_params[:item_id].to_i)
  @cart_item = current_user.cart.cart_items.create(assign_item_details)
  redirect_back(fallback_location: user_cart_path(current_user))
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

  def assign_item_details
    return {item: @item.name, quantity: cart_item_params[:quantity], price: @item.price}
  end 
  
end
