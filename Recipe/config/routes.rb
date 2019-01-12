Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'devise/registrations', sessions: 'devise/sessions' }
  root 'home#index'
  
  resources :user, only: [:index]
  get '/recipe/new', to: 'recipe#new'
  get '/recipe/:id', to: 'recipe#details'
  post '/recipe', to: 'recipe#create'
  post '/recipe/:id/comment', to: 'comment#create'
  get '/recipe/:id/edit', to: 'recipe#edit'
  post '/recipe/:id/modify', to: 'recipe#modify'
  delete '/recipe/:id/delete', to: 'recipe#delete'
  post '/comment/:id/modify', to: 'comment#edit'
  delete '/comment/:id/delete', to: 'comment#delete'
end
