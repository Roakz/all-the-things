class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :authorise
  skip_before_action :authorise, only: [:show, ]

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = current_user.shop.items.create(item_params)
    @item.item_picture.attach(item_params[:item_picture])
    @category = category_check 
  
    if @category.valid? && @item.save(item_params) 
      @item.categories.push(@category)
      redirect_to user_shop_path(current_user.id, current_user.shop.id)
    else
      flash[:alert] = @item.errors.full_messages.to_sentence + @category.errors.full_messages.to_sentence
      redirect_to new_user_shop_item_path(current_user.id, current_user.shop.id, @item.id)
    end



  end

  def edit
    @item = Item.find(params[:id])
  end

  def update

    @item = Item.find(params[:id])
    @item.item_picture.attach(item_params[:item_picture])
    @category = category_check
    
    if @category.valid? && @item.update(item_params)
      @item.categories.push(@category)
      redirect_to user_shop_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages.to_sentence + @category.errors.full_messages.to_sentence
      redirect_to edit_user_shop_item_path(@item)
    end

  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_shop_path(current_user, current_user.shop.id)
  end

  private 

  def item_params
    params.require(:item).permit(:name, :quantity, :hook, :content, :price, :item_picture)
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

  def authorise
  
    return if current_user.id == params[:user_id].to_i && current_user.shop.id == params[:shop_id].to_i 

    flash[:alert] = "soz....You can only create and edit your own shop Items :("
    
    redirect_to user_profile_path(current_user.id)
  
  end

end
