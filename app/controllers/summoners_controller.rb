class SummonersController < ApplicationController
  # POST /me/summoner
  def create
    return unless current_user
    return if current_user.summoner.present?

    @summoner = Summoner.new(name: summoner_params[:name], user: current_user)

    if @summoner.save
      redirect_to user_path_with_nickname_maybe(current_user)
    else
      redirect_to user_path_with_nickname_maybe(current_user), alert: 'Summoner Name inválido!'
    end

  end

private

  def summoner_params
    params.require('summoner').permit('name')
  end
end
