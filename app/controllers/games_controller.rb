class GamesController < ApplicationController
  def index
    # remember the domain name selected
    @date.year = params[:date] || 'All'
    # get all teams based on domain query
    @teams = Team.find_all_with_year(@date.year)
    # get all the available years
    @dates.year = @games.all_years
  end

  def new
    return unless authorized
    @team = Team.find(params[:team_id])
    @game = @team.games.new
  end

  def create
    return unless authorized
    @team = Team.find(params[:team_id])
    @game = @team.games.new(game_params)
    @game.user = @current_user
    @game.save
    redirect_to "/teams/#{@team.id}"
    # redirect_to team_path(@game)
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
    params.require(:game).permit(:date, :away_team, :home_team, :away_team_score, :home_team_score, :betting_line, :over_under, :away_team_id, :home_team_id)
  end

end
