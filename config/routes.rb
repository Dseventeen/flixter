Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  root 'static_pages#index'
end