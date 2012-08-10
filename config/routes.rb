Foxandxss::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'static_pages#home'

  resources :pages

  resources :contacts

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml', {:prefix_on_default_locale => true})

  match '*path', to: redirect { | params, request| "/#{I18n.default_locale}#{request.fullpath}"}
end
