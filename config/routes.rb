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
      get :refresh_user_total_equity
      get :refresh_total_equity
      get :refresh_coin_usd_value
      # get :new_modal
      # get :edit_modal
      # post :search_coins
      # get :crypto_modal
      # get :get_main_prices
      # get :coin_info_modal
      # get :add_coin
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
  
  resources :parfum_recipes do
    collection do
      get :delete_parfum_recipes
    end
  end

  resources :parfum_materials do
    collection do
      get :delete_parfum_materials
    end
  end

  resources :parfum_drop_avg_mls do
    collection do

    end
  end

  resources :parfums do
    collection do
      get :new_modal
      get :edit_modal
      get :parfum_materials
      get :parfum_recipes
      get :parfum_drop_avg_mls
      get :new_parfum_modal
      get :edit_parfum_modal
      get :delete_parfum
      get :new_parfum_materials_modal
      get :edit_parfum_materials_modal
      get :new_parfum_recipes_modal
      get :refresh_parfum_recipe_modal_data
      get :calc_ml_modal
      get :edit_parfum_recipes_modal
      get :change_one_drop_info
      # post :save_parfum_material
      # post :update_parfum_material
    end
  end
end
