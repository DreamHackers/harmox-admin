Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  get 'home/index'

  get 'home/show'

  root to: "home#index"
end
