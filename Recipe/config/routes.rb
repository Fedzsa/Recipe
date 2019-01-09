Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'devise/registrations', sessions: 'devise/sessions' }
  root 'home#index'
  
  resources :user, only: [:index]
  get '/recipe/new', to: 'recipe#new'
  get '/recipe/:id', to: 'recipe#details'
  post '/recipe', to: 'recipe#create'
  post '/recipe/:id/comment', to: 'recipe#addcomment'

end
