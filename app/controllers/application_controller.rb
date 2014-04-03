class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_path_with_nickname_maybe(user)
    if user.nickname.present?
      user_path(user.nickname)
    else
      user_path(user.id)
    end
  end
  helper_method :user_path_with_nickname_maybe
end
