Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'devise/registrations', sessions: 'devise/sessions' }
  root 'home#index'

end
