Rails.application.routes.draw do
  get 'intervention/index'
  post 'twilio/sms'
  devise_for :users
  
  resources :quotes
  resources :leads
  resources :interventions
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "residential" => "pages#residential"
  get "commercial" => "pages#commercial"
  get "quotes" => "pages#quote"
  get "interventions" => "pages#intervention"

  get "/index" => "pages#index"

  # /quotes is the action from the form in quote.html.erb
  post "/quotes" => "quotes#create"

  # /leads is the action from the form in index.html.erb
  post "/leads" => "leads#create"

  # /interventions is the action from the form in intervention.html.erb
  post "/interventions" => "interventions#create"

end
