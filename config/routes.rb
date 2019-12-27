Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :category_frees, only: [:index, :show] do
    resource :recipe_categories, only: :destroy
    member do
      get "menu_category"
      get "cuisine_category"
    end
    collection do
      get "random"
      get "search"
      post "result"
    end
  end
  resources :recipes do
    resource :like, only: [:create, :destroy]
    collection do
      get "search"
    end
    resources :recipe_urls, only: [:create, :destroy]
    resources :ingredient_amounts, only: [:destroy, :create]
  end
end
