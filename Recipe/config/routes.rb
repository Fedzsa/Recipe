Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'devise/registrations', sessions: 'devise/sessions' }
  root 'home#index'
  
  resources :user, only: [:index]
  get '/recipe/new', to: 'recipe#new'
  post '/recipe', to: 'recipe#create'
end
