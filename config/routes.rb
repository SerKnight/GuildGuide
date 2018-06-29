Rails.application.routes.draw do
  namespace :admin do
    resources :journeys
    resources :messages
    resources :message_templates
    resources :roles
    resources :sentiments
    resources :users
    resources :user_journeys
    resources :received_messages
    resources :sent_messages

    root to: "journeys#index"
  end


  get '/sms/receive', to: 'messages#receive'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
