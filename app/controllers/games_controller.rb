class GamesController < ApplicationController

    before_action(:show_helper, except: [:index, :new, :create])
    before_action(:require_login)
    before_action(:index_helper, only: :index)

    layout "application"

    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @games = user.games
        end
    end

    def show
    end

    def new
        @game = Game.new
        @game.ratings.build(user: current_user)
        @game.ratings.build(user: current_user)
        @ratings = @game.ratings.select{|r| r.user_id == current_user.id}
    end

    def create
        @game = Game.new(game_params)
        @game.ratings.each {|r| r.user = current_user}
        if @game.save
            flash[:message] = "Successfully created"
            redirect_to game_path(@game)
        else
            @ratings = @game.ratings.select{|r| r.user_id == current_user.id}
            render :new
        end
    end


    def destroy
        @game.delete
        flash[:message] = "Successfully deleted"
        redirect_to games_path
    end


    private

        def game_params
            params.require(:game).permit(:name, ratings_attributes: [:score, :user_id, :id])
        end

        def set_game
            @game = Game.find_by(id: params[:id])
        end


end