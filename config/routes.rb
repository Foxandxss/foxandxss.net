Foxandxss::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'static_pages#home'

  resources :pages

  resources :contacts
end
