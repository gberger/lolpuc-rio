module UserHelper
  def name_with_icon(user)
    (user.name + (user.admin? ? " #{icon(:star)}" : '')).html_safe
  end
end
