class ShopController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def index
      @shop = Shop.where('name LIKE ?', "%#{params[:search]}%")
  end
  
  def show
    @shop = Shop.find(params[:id])
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
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :content, :hook, :shop_image)
  end
end
