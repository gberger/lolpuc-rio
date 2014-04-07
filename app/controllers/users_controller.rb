class UsersController < ApplicationController
  def show
    @user = User.find_by_nickname(params[:id_or_nickname]) || User.find_by_id!(params[:id_or_nickname])

    # we prefer nickname paths, so if that's available, redirect
    unless current_path == user_path(@user)
      return redirect_to user_path(@user), status: :moved_permanently
    end
  end
end
