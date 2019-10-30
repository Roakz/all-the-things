class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.shop.items.new(item_params)
    current_user.shop.items.last.item_picture.attach(params[:item_picture])
    @category = params[:category]

    if Category.where(name: @category)
      @item.categories << Category.where(name: @category)
    else
    @item.categories.create(name: @category)
    end

    @item.save

    if @item.save 
      redirect_to user_shop_path(current_user, params[:shop_id])
    else
      flash[:alert] = @item.errors.full_messages.to_sentence
      redirect_to new_user_shop_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # render json: item_params 
    # return

    @item = Item.find(params[:id])
    category = Category.where(name: category_params[:name]) || Category.create!(name: category_params[:name])
    @item.categories.push(category)

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
    params.require(:item).permit(:name, :quantity, :hook, :content, :price, :item_picture)
  end
  def category_params
    params.require(:item).permit(category: [:name])
  end
end
