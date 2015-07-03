Rails.application.routes.draw do

  devise_for :users
  resources :courses
  
  get "about" =>         "pages#about"
  get "contact" =>       "pages#contact"
  get "help" =>          "pages#help"
  get "privacy" =>       "pages#privacy"
  get "terms" =>         "pages#terms"
  get "account" =>       "pages#account"
  get "communication" => "pages#communication"

  get '/robots.:format' => 'pages#robots'
  root "pages#index"

end
