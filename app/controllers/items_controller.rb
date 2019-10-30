class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = current_user.shop.items.create(item_params)
    current_user.shop.items.last.item_picture.attach(params[:item_picture])
    
    category = Category.where(name: category_params[:category][:name])

    if !  category[0] 
    category = Category.create(name: category_params[:category][:name])
    end

    @item.categories.push(category)  

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
    category = Category.where(name: category_params[:category][:name]) 
    if ! category[0]
    Category.create(name: category_params[:category][:name])
    end

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
