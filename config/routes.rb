Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus, only: [ :index, :show, :new, :create, :edit, :update, :destroy ] do
    resources :menu_recipes, only: [ :create, :destroy ]
    resources :grocery_items, only: [ :index, :create ]
    resources :accesses, only: [:create]
  end

  resources :recipes do
    resources :preparations, only: [ :create, :destroy ]
  end

  resources :menu_recipes, only: [ :show, :update, :destroy ] do
    resources :reviews, only: [ :create ]
  end

  resources :ingredients
  resources :filters

  post '/menus/:menu_id/menu_recipes/:id/switch', to: "menu_recipes#switch", as: :switch_menu_recipe
  post '/menu_recipes/:id/unfavorite', to: "recipes#favorite", as: :recipe_favorite
  delete '/menu_recipes/:id/favorite', to: "recipes#unfavorite", as: :recipe_unfavorite

  post '/menus/:id/create_grocery', to: "grocery_items#create_grocery", as: :menu_create_grocery_list

  resources :shared_menus, only: [:index ]

  resources :grocery_items, only: [ :update ]
end
