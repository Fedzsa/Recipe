Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'devise/registrations', sessions: 'devise/sessions' }
  root 'home#index'
  get 'user/:id', to: 'user#index'
  get 'user/:id/create', to: 'user#create'
end
