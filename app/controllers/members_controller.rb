class MembersController < ApplicationController
  before_action :set_team
  before_action :authorize_team

  # POST /teams/TSM/members
  def create
    user = User.ci_find!(:nickname, params[:nickname])
    @member = @team.members.new(member_params.merge(user: user))
    if @team.save
      render json: @member
    else
      head :bad_request
    end
  end

  # PATCH/PUT /teams/TSM/members/1/role
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      render json: @member
    else
      head :bad_request
    end
  end

  # DELETE /teams/TSM/members/1
  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      head :ok
    else
      head :bad_request
    end
  end

private
  def set_team
    @team = Team.ci_find!(:acronym, params[:team_acronym])
  end

  def authorize_team
    authorize! :manage, @team
  end

  def member_params
    params[:member].permit(:role)
  end
end
