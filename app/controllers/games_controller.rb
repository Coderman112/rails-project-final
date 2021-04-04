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