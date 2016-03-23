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
    @game_count = @games.count.to_f
    @wins = @games.where(winner: @team.id).count.to_f
    @losses = @game_count - @wins
    #  @wins = Team.wins(@games, @team)
    # @betting_line = Team.betting_line_sum(@games)
    @betting_lines = (@games.map{|game| game.betting_line}.sum) / @game_count
    @over_unders = (@games.map{|game| game.over_under}.sum) / @game_count

    @win_percent = ((@wins/@game_count) * 100)
    @betting_line_success_count = @games.where(betting_line_winner: @team.id).count
    @betting_line_success_rate = (@betting_line_success_count / @game_count) * 100

    @over_under_success_rate = (@games.map{|game| game.over_under_success}.sum / @game_count) * 100


  end

  private
  def team_params
    params.require(:team).permit(:name, :division, :conference)
  end

end
