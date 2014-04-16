Lolpucrio::Application.routes.draw do

  # USERS
  get 'users', to: 'users#index'
  get 'users/:id_or_nickname', to: 'users#show', as: 'user', :constraints => { :id_or_nickname => /[\w\.]+/ }

  # SUMMONERS
  post 'summoners', to: 'summoners#create'

  # TEAMS
  resources 'teams', param: :acronym do
    # MEMBERS
    resources 'members', only: [:create, :update, :destroy]
  end

  # TOURNAMENTS
  # TODO

  # STATIC
  root 'static#index'
  get 'index', to: 'static#index'
  get 'ping', to: 'static#ping'

  # AUTHENTICATION
  get 'auth/:provider/callback', to: 'sessions#create', as: 'login'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'logout'

  # CATCH-ALL
  match '*a', :to => 'errors#routing', via: :get

end
