class ShopController < ApplicationController

  before_action :authenticate_user!
  before_action :authorise
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :authorise, only: [:index, :show]

  def index
      @shop = Shop.where('name LIKE ?', "%#{params[:search]}%")
  end
  
  def show
    @shop = Shop.find(params[:id])
    @cart_item = CartItem.new 
  end
  
  def new
    @shop = current_user.build_shop
  end

  def create
    @shop_new = current_user.create_shop(shop_params)
    current_user.shop.shop_image.attach(shop_params[:shop_image])
    if @shop_new.save
      redirect_to user_shop_path(current_user, @shop_new)
    else
      flash[:error] = @shop_new.errors.full_messages.to_sentence 
    end
  end

  def edit
    @shop = current_user.shop
  end

  def update
    @shop = current_user.shop.update(shop_params)
    current_user.shop.shop_image.attach(shop_params[:shop_image])
    redirect_to user_shop_path(current_user)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    if ! current_user.has_role?(:admin)
    flash[:alert] = "Your shop was deleted"
    redirect_to user_profile_path(current_user.id)
    else 
      flash[:alert] = "Shop successfully deleted"
      redirect_to user_profile_path(current_user)
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :content, :hook, :shop_image)
  end

  def authorise
  
    return if current_user.has_role?(:admin) || current_user.id == params[:user_id].to_i && current_user.shop.id == params[:id].to_i

    flash[:alert] = "soz....You can only create and edit your own shops :("
    
    redirect_to user_profile_path(current_user.id)
  
  end

end
