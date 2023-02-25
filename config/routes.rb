Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root to: "groups#index"
  resources :groups, only: [:index,:new, :create] do
    resources :entities, only: [:index]
  end
  
end
