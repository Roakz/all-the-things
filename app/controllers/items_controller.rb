class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = current_user.shop.items.create(item_params)
    @item.item_picture.attach(params[:item_picture])

    @item.categories.push(category_check)  

    if @item.save(item_params) 
      redirect_to user_shop_path(current_user.id, current_user.shop.id)
    else
      flash[:alert] = @item.errors.full_messages.to_sentence
      redirect_to new_user_shop_item_path(current_user.id, current_user.shop.id, @item.id)
    end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update

    @item = Item.find(params[:id])
    @item.categories.push(category_check)

    if @item.update(item_params)
      redirect_to user_shop_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages.to_sentence
      redirect_to edit_user_shop_item_path(@item)
    end

  end

  def destroy
  end

  private 

  def item_params
    params.require(:item).permit(:name, :quantity, :hook, :content, :price)
  end

  def category_params
    params.require(:item).permit(category: [:name])
  end
  # Helper method checks for existing category assigns it to the variable if nill then creates a new category
  def category_check
    category = Category.where(name: category_params[:category][:name]) 

      if ! category[0]
        category = Category.create(name: category_params[:category][:name])
      end

    return category
  end

end
