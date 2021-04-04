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