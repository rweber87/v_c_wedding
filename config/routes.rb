Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'

  get '/signup', to: 'users#new', as: :users
  post '/signup', to: 'users#create', as: :create_user

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: :signout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
