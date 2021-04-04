class SessionsController < ApplicationController

    def new
        @errors = []
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_items_path(@user)
        elsif @user
            @errors = ["Invalid Password"]
            render :new
        else
            @errors = ["Invalid Username"]
            render :new
        end
    end
end