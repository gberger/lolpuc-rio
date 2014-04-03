Lolpucrio::Application.routes.draw do

  get 'users/:nickname', to: 'users#show'

  root 'static#index'
  get 'index', to: 'static#index'
  get 'welcome', to: 'static#welcome', as: 'welcome'
  get 'ping', to: 'static#ping'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
