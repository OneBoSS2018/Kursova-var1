Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: %i[index show]
  resources :questions
  responses :answers, only: %i[create destroy]
  
end
