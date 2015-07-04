Rails.application.routes.draw do
  #  , skip: [:sessions]
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, skip: [:sessions, :registrations]


  get 'home/index'

  get 'home/show'

  root to: "home#index"

  devise_scope :user do
    # sessions
    get 'signin' => 'devise/sessions#new', as: :new_user_session
    post 'signin' => 'devise/sessions#create', as: :user_session
    get 'signout' => 'devise/sessions#destroy', as: :destroy_user_session

    # registrations
    get 'cancel' => 'devise/registrations#cancel', as: :cancel_user_registration
    post ':username' => 'devise/registrations#create', as: :user_registration
    get 'signup' => 'devise/registrations#new', as: :new_user_registration
    get ':username/edit' => 'devise/registrations#edit', as: :edit_user_registration
    patch ':username' => 'devise/registrations#update'
    put ':username' => 'devise/registrations#update'
    delete ':username' => 'devise/registrations#destroy'
  end

  resources :bots, :module => :bot, :path => ':username', :except => :edit
  match ":username/:id/settings", :to => 'bot/bots#settings', :via => :get, :as => :edit_bot

  match ":username/bots/auth/twitter", :to => 'bot/bot_omniauth_callbacks#twitter', :via => [:get, :post], :as => :bot_omniauth_authorize_twitter
end
