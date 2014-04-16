require "spec_helper"

describe 'Routing' do

  # USERS
  it { should route(:get, '/users').to('users#index') }
  it { should route(:get, '/users/1').to('users#show', id_or_nickname: '1') }

  # ME
  it { should route(:patch, '/me/summoner').to('users#set_summoner_name') }

  # TEAMS
  it { should route(:get, '/teams').to('teams#index') }
  it { should route(:get, '/teams/new').to('teams#new') }
  it { should route(:post, '/teams').to('teams#create') }
  it { should route(:get, '/teams/TSM').to('teams#show', acronym: 'TSM') }
  it { should route(:get, '/teams/TSM/edit').to('teams#edit', acronym: 'TSM') }
  it { should route(:put, '/teams/TSM').to('teams#update', acronym: 'TSM') }
  it { should route(:delete, '/teams/TSM').to('teams#destroy', acronym: 'TSM') }

  # MEMBERS
  it { should route(:post, '/teams/TSM/members').to('members#create', team_acronym: 'TSM') }
  it { should route(:put, '/teams/TSM/members/1').to('members#update', team_acronym: 'TSM', id: '1') }
  it { should route(:delete, '/teams/TSM/members/1').to('members#destroy', team_acronym: 'TSM', id: '1') }

  # TOURNAMENTS
  # TODO

  # STATIC
  it { should route(:get, '/').to('static#index') }
  it { {get: '/index'}.should route_to('static#index') } # one-way
  it { should route(:get, '/ping').to('static#ping') }

  # AUTHENTICATION
  it { should route(:get, '/auth/facebook/callback').to('sessions#create', provider: 'facebook') }
  it { should route(:get, '/signout').to('sessions#destroy') }

  # CATCH-ALL
  it { {get: '/asdfghjkl'}.should route_to('errors#routing', a: 'asdfghjkl') }
  it { {get: '/asdfghjkl/zxcvbnm'}.should route_to('errors#routing', a: 'asdfghjkl/zxcvbnm') }

end