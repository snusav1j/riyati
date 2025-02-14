Rails.application.routes.draw do
  root "home#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/user_profiles/", to: "user_profiles#index"
  get "/logout", to: "sessions#logout"

  resources :sessions do
    collection do
      get :logout
    end
  end
  
  resources :cryptos do
    collection do
      get :new_modal
      get :edit_modal
      post :search_coins
      get :crypto_modal
      get :get_main_prices
      get :coin_info_modal
      get :add_coin
    end
  end

  resources :users do
    collection do
      get :new_modal
      get :edit_modal
      get :search_coins
      get :crypto_modal
      get :get_user_coins
    end
  end
end
