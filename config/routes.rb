Rails.application.routes.draw do


root "shop#index"

devise_for :users, controllers: { registrations: "registrations" }
resources :users do
    resources :shop
end

resources :user_profiles

end
