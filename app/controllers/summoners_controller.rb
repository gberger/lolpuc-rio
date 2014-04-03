class SummonersController < ApplicationController
  # POST /me/summoner
  def create
    return unless current_user
    return unless current_user.summoners.count == 0

    @summoner = Summoner.new(name: params[:summoner_name], user: current_user)

    @summoner.save

    redirect_to user_path_with_nickname_maybe(current_user)
  end
end
