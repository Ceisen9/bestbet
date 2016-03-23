class TeamsController < ApplicationController
  def index
    # remember the domain name selected
    @division = params[:division]
    @conference = params[:conference]
    # get all teams based on domain query
    if @division
      @teams = Team.find_all_with_division(@division)
    elsif @conference
      @teams = Team.find_all_with_conference(@conference)
    else
      @teams = Team.all
      @division = 'All'
      @conference = 'All'
    end
    # get all the available divisions and conferences
    @divisions = @teams.all_divisions
    @conferences = @teams.all_conferences

  end

  def show
    @team = Team.find(params[:id])
    # remember the domain name selected
    @season = params[:season]
    # get all teams based on domain query
    if @season
      @games = @team.games.where(season: @season)
    else
      @games = @team.games
      @season = 'All'
    end
    # get all the available years
    # @seasons = @team.games.map{|game| game.season}.uniq.sort
    @seasons = Team.all_years(@team)


  end

  private
  def team_params
    params.require(:team).permit(:name, :division, :conference)
  end

end
