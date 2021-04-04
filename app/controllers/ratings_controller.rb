class RatingsController < ApplicationController
    before_action(:require_login)
    before_action(:show_helper, only: [:edit, :update])
        before_action(:index_helper, only: :index)
    layout "application"

    def index
        if params[:score]
            @ratings = Rating.score_search(params[:score])
        end
    end

    def new
        if params[:game_id]
            @game = Game.find_by(id: params[:game_id])
            @rating = @game.ratings.build
            @games = Game.all
        else
            @rating = Rating.new
            @games = Game.all
        end
    end

    def create
        @rating = Rating.create(rating_params)
        @rating.user = current_user
        if params[:game_id]
            @rating.game_id = params[:game_id]
        end
        if @rating.save
            flash[:message] = "Successfully created"
            redirect_to games_path
        else
            @games = Game.all
            render :new
        end
    end

    def edit
        if @rating.user != current_user
            flash[:message] = "That is not your rating"
            redirect_to '/ratings'
        end
    end

    def update

        if @rating.update(rating_params)
            redirect_to ratings_path
        else
            render :edit
        end
    end


    private

    def rating_params
        params.require(:rating).permit(:score, :game_id)
    end

    def set_rating
        @rating = Rating.find_by(id: params[:id])
    end

end