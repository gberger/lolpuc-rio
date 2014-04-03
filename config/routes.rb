Lolpucrio::Application.routes.draw do

  get 'users/:id_or_nickname', to: 'users#show', as: 'user', :constraints => { :id_or_nickname => /[\w+\.]+/ }
  post 'me/summoner', to: 'summoners#create'

  root 'static#index'
  get 'index', to: 'static#index'
  get 'welcome', to: 'static#welcome', as: 'welcome'
  get 'ping', to: 'static#ping'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # anything
  match '*a', :to => 'errors#routing', via: :get

end
