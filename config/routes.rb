Rails.application.routes.draw do
  devise_for :users

  resources :courses

  get 'help',             to: 'help_requests#new'
  post 'help_requests',   to: 'help_requests#create'
  get 'help_email_sent',  to: 'help_requests#help_email_sent'

  get 'about',            to: 'pages#about'
  get 'contact',          to: 'pages#contact'
  get 'privacy',          to: 'pages#privacy'
  get 'terms',            to: 'pages#terms'
  get 'account',          to: 'pages#account'
  get 'communication',    to: 'pages#communication'
  get '/robots.:format',  to: 'pages#robots'

  root 'pages#home'
end
