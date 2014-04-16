class TournamentsController < ApplicationController
  # GET /tournaments
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  def show
    @tournament = Tournament.find(params[:id])
  end

  # GET /tournaments/new
  def new
    authorize! :create, Tournament

    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
    @tournament = Tournament.find(params[:id])
    authorize! :edit, @tournament
  end

  # POST /tournaments
  def create
    authorize! :create, Tournament
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament, notice: 'Tournament was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    @tournament = Tournament.find(params[:id])
    authorize! :edit, @tournament

    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: 'Tournament was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tournaments/1
  def destroy
    @tournament = Tournament.find(params[:id])
    authorize! :destroy, Tournament

    @tournament.destroy
    redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.'
  end

private
  def tournament_params
    params[:tournament].permit(:name, :edital)
  end
end
