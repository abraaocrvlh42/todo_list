Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :update, :destroy]
  
  root "tasks#index"
end
