Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'home#login'
  get 'signup', to: 'home#signup'
end
