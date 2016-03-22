class TeamsController < ApplicationController
  def index
    # remember the domain name selected
    @division = params[:division] || 'All'
    # get all people based on domain query
    @teams = Team.find_all_with_division(@division)
    # get all the available domain names
    @divisions = @teams.all_divisions
  end

  def show
    @team = Team.find(params[:id])
  end

  private
  def team_params
    params.require(:team).permit(:name, :division, :conference)
  end

end
