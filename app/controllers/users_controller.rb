class UsersController < ApplicationController

    before_action(:require_login, except: [:new, :create])

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Successfully created account!"
            redirect_to user_games_path(@user)
        else
            render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end