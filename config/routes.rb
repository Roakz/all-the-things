Rails.application.routes.draw do


# Home page route for shop index pages
root "shop#index"

#categories index and show pages get routes
get 'categories/index'
get 'categories/show'

#  get root set oustide of the resource and before it so that rails finds it first
get "shop/index", to:"shop#index"

# overiding the devise registration controller path to set my own after registration route
# shop routes nested within user and item routes nested within shop
devise_for :users, controllers: { registrations: "registrations" }
resources :users do
    resources :shop do
      resources :items 
    end
end

# User profile resource routes
resources :user_profiles

end
