Rails.application.routes.draw do
  devise_for :users
  root 'page#dashboard'
end
