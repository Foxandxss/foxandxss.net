Foxandxss::Application.routes.draw do
  root to: 'static_pages#home'

  resources :pages

  resources :contacts
end
