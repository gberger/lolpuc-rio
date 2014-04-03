class UsersController < ApplicationController
  def show
    @user = User.find_by_nickname(params[:id_or_nickname]) || User.find_by_id(params[:id_or_nickname])
  end
end
