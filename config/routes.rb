Rails.application.routes.draw do
  get 'favorites/update'
  devise_for :users
  root "recipes#index"
  resources :recipes
end
