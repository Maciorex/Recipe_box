Rails.application.routes.draw do
  get 'favorites/update'
  get 'favorites/show'
  devise_for :users
  root "recipes#index"
  resources :recipes
end
