Rails.application.routes.draw do

root "shop#index"

get "shop/index", to:"shop#index"

devise_for :users, controllers: { registrations: "registrations" }
resources :users do
    resources :shop do
      resources :items 
    end
end

resources :user_profiles

end
