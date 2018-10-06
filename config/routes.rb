Rails.application.routes.draw do
  get "articles/search"
  devise_for :users, controllers:{
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords"
  }
  resources :categories
  resources :articles do
    resources :comments
  end
  resources :polls
  post "contacs/new"
  get 'welcome/contacto'
  resources :contacts, only: [:create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root :to => 'welcome#index'

end
