Rails.application.routes.draw do

  get 'users/index'
  get 'users/destroy'
# Home page route for shop index pages
root "shop#index"

#categories index and show pages get routes
get 'categories/index'
get 'categories/:id', to: "categories#show", as: "categories_show"

#  get root set oustide of the resource and before it so that rails finds it first
get "shop/index", to:"shop#index"
get "shop-owners/complete", to:"shop_owners#success"
get "shop-owners/cancel", to: "shop_owners#cancel"

# overiding the devise registration controller path to set my own after registration route
# shop routes nested within user and item routes nested within shop
devise_for :users, controllers: { registrations: "registrations" }
resources :users do
    get "cart", to: "carts#show"
    get "shop-owners", to: "shop_owners#new"
    resources :shop do
      resources :items 
    end
end

delete "users/:user_id/cart/:cart_id/cart_items/:id", to: "cart_items#destroy", as: "user_cart_items"
post "users/:user_id/cart/:cart_id/cart_items", to: "cart_items#create", as: "cart_items"
patch "users/:user_id/cart/:cart_id/cart_items/:id/", to: "cart_items#update", as: "cart_item"

# User profile resource routes
resources :user_profiles

end
