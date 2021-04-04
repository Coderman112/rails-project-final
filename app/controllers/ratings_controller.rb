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