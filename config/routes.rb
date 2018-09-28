Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :articles
  resources :polls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'welcome/contacto'
  root :to => 'welcome#index'
end
