class GamesController < ApplicationController
  def index

    #record the params to grab from the browser
    @season = params[:season]

    # get all teams based on domain query
    if @season
      @games = Game.where(season: @season)
    else
      @games = Game.all
      @season = 'All'
    end

    # get all the available years
    @seasons = @games.map{|game| game.season}.uniq.sort

    #various statistics
    @game_count = @games.count

    @home_team_win_percent = ((@games.select{|game| game.home_team_wins}.count.to_f / @game_count.to_f) * 100).to_f.round(1)
    @away_team_win_percent = ((@games.select{|game| game.away_team_wins}.count.to_f / @game_count.to_f) * 100).to_f.round(1)

    @betting_lines = (@games.map(&:betting_line).sum / @game_count).round(1)
    # @betting_lines = (Game.betting_line_sum(@games) / @game_count).round(1)

    @over_unders = (@games.map(&:over_under).sum / @game_count).round(1)

    @betting_line_success_rate_home = ((@games.select{|game| game.betting_line_success_count_home}.count.to_f / @game_count.to_f) * 100).round(1)

    @betting_line_success_rate_away = ((@games.select(&:betting_line_success_count_away).count.to_f / @game_count.to_f) * 100).round(1)

    @over_under_success_rate = ((@games.map(&:over_under_success).sum.to_f / @game_count.to_f) * 100).round(1)

  end

  def new
    @team = Team.find(params[:team_id])
    @game = @team.games.new
  end

  def create
    @team = Team.find(params[:team_id])
    @game = @team.games.new(game_params)
    @game.user = @current_user
    @game.save
    redirect_to "/teams/#{@team.id}"
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    return unless authorized
    @game = Game.find(params[:id])
  end

  def update
    return unless authorized
    @game = Game.find(params[:id])
    @game.update(game_params)

    redirect_to team_path(@game)
  end

  def destroy
    return unless authorized
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:date, :away_team, :home_team, :away_team_score, :home_team_score, :betting_line, :over_under, :away_team_id, :home_team_id, :season)
  end

end
