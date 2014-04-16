class TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/TSM
  def show
    @team = Team.ci_find!(:acronym, params[:acronym])
  end

  # GET /teams/new
  def new
    authorize! :create, Team

    @team = Team.new
  end

  # GET /teams/TSM/edit
  def edit
    authorize! :edit, @team
    @team = Team.ci_find!(:acronym, params[:acronym])
  end

  # POST /teams
  def create
    authorize! :create, Team
    @team = Team.new_with_leader(team_params, current_user)

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teams/TSM
  def update
    @team = Team.ci_find!(:acronym, params[:acronym])
    authorize! :edit, @team

    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teams/TSM
  def destroy
    @team = Team.ci_find!(:acronym, params[:acronym])
    authorize! :destroy, @team

    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

private
  def team_params
    params[:team].permit(:name, :acronym)
  end
end
