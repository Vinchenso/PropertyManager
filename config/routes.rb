Rails.application.routes.draw do
  post 'balance/import'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'page#dashboard'
end
