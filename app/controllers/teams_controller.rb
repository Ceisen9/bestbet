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
    # remember the domain name selected
    @team = Team.find(params[:id])

    #record the params to grab from the browser
    @season = params[:season]
    @location = params[:location]

    # get all the available years
    @seasons = Team.all_years(@team)
    @locations = ['Home', 'Away']

    # get all teams based on domain query
    if @season
      @games = @team.games.where(season: @season)
    elsif @location
      if @location = 'Home'
        @games = @team.games.where(home_team: @team.id)
      elsif @location = 'Away'
        @games = @team.games.where(away_team: @team.id)
      end
    else
      @games = @team.games
      @season = 'All'
      @location = 'All'
    end

    #various statistics
    @game_count = @team.game_count(@games)

    @wins = @team.wins(@games)

    @losses = @game_count.to_i - @wins

    @betting_lines = (@team.betting_line_sum(@games) / @game_count).round(1)

    @over_unders = (@team.over_under_sum(@games) / @game_count).round(1)

    @win_percent = ((@wins.to_f/@game_count) * 100).round(1)

    @betting_line_success_rate = ((@team.betting_line_success_count(@games) / @game_count) * 100).round(1)

    @over_under_success_rate = ((@team.over_under_success_count(@games) / @game_count) * 100).round(1)

  end

  private
  def team_params
    params.require(:team).permit(:name, :division, :conference)
  end

end
