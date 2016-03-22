class TeamsController < ApplicationController
  def index
    # remember the domain name selected
    @division = params[:division] || 'All'
    # get all teams based on domain query
    @teams = Team.find_all_with_division(@division)
    @teamsc = Team.find_all_with_conference(@conference)
    # get all the available divisions and conferences
    @divisions = @teams.all_divisions
    @conferences = @teams.all_conferences

  end

  def show
    @team = Team.find(params[:id])
  end

  private
  def team_params
    params.require(:team).permit(:name, :division, :conference)
  end

end
