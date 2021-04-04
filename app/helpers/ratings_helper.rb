module RatingsHelper

    def show_game_name(r, index)
        r.game.name if index
    end


    def form_url_helper(game)
        game ? game_ratings_path(game) : ratings_path
    end

end