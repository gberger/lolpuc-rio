class StaticController < ApplicationController
  def index
  end

  def welcome
    @summoner = Summoner.new
  end

  def ping
    head :ok
  end
end
