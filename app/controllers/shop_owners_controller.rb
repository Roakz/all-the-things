require 'stripe'

class ShopOwnersController < ApplicationController

  def new
    
    Stripe.api_key = 'sk_test_2YlBMbpEnNdEbm8vFarTRej900Hd5T9Rar'

    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
    name: 'Shop Ownership',
    description: 'Access all shop owner features! create and edit your shop and add as many items to it as you want !!',
    amount: 200,
    currency: 'aud',
    quantity: 1,
    }],
    success_url: "#{root_url}/shop-owners/complete",
    cancel_url: "#{root_url}/shop-owners/cancel",
    )

  end

  def success 
    assign_role
    flash[:notice] = "You are now a shop owner! Happy selling!!"
    redirect_to user_profile_path(current_user)
  end  

  def cancel

    flash[:alert] = "Your purchase was cancelled."
    redirect_to user_profile_path(current_user)
   
  end

  private 
    
  def assign_role

    current_user.add_role :shop_owner

  end 

end
