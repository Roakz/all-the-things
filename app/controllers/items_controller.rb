class ItemsController < ApplicationController

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.shop.items.create(item_params)
    @category = params[:category]
    @item.categories.create(name: @category)

    if @item.save 
      redirect_to user_shop_path(current_user, params[:shop_id])
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      redirect_to new_user_shop_item_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def item_params
    params.require(:item).permit(:name, :quantity, :hook, :content, :price)
  end
end
