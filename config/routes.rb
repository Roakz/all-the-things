Rails.application.routes.draw do

resources :user_profiles
devise_for :users, controllers: { registrations: "registrations" }

end
