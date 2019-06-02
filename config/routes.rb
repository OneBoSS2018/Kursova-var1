Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: %i[index show]
  resources :questions do
  resources :answers
  post :right
end

end
