Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "categories#index", as: :authenticated_root
  end
  root to: 'splash#splash'
  resources :categories do
    resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  # resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
  #   resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]
  #   # resources :records, only: [:index, :new, :create, :edit, :update, :destroy]
  

  # Other routes...
end
