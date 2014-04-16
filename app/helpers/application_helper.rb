module ApplicationHelper
  def facebook_login_path
    '/auth/facebook'
  end

  def icon(name)
    "<i class='fa fa-#{name}'></i>".html_safe
  end
end
