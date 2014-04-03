class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

private

  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404: #{exception.message}"
    end
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
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
