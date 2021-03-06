class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
  @item = Item.find(cart_item_params[:item_id].to_i)
  @cart_item = current_user.cart.cart_items.create(assign_item_details)
  redirect_back(fallback_location: user_cart_path(current_user))
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to user_cart_path(current_user.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: cart_item_params[:quantity])
    if @cart_item.save
      redirect_to user_cart_path(current_user.id)
    else  
      flash[:alert] = @cart_item.errors.full_messages.to_sentence
    end  
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

  def assign_item_details
    return {item: @item.name, quantity: cart_item_params[:quantity], price: @item.price}
  end 
  
end
