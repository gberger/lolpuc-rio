class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    if user.summoners.count > 0
      redirect_to(request.env['omniauth.origin'] || root_path)
    else
      redirect_to(welcome_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(request.env['omniauth.origin'] || root_path)
  end
end
