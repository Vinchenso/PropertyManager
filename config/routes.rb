Rails.application.routes.draw do
  get 'zapier_webhooks/recieve'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'page#dashboard'
end
