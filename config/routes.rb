Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'

  devise_for :users, skip: :registrations do
    delete '/logout', to: 'sessions#destroy', as: :destroy_user_session
    get '/login', to: 'sessions#new', as: :new_user_session
    post '/login', to: 'sessions#create', as: :user_session
  end
  devise_for :doners, controllers: { registrations: 'doner/registrations' }, skip: :sessions
  devise_for :super_admins, skip: :sessions
  resources :dashboards
  resources :foods
  get '/assign', to: 'foods#assign'
  patch '/assign', to: 'foods#assign_food'

end
