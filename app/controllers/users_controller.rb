class UsersController < ApplicationController

    skip_before_action :authenticate
    def create
        @user = User.create(user_params)
        if @user.save
            render json: @user.as_json(only: [:email, :first_name, :last_name])
        else
            render json: {message: "User saving error", errors: @user.errors.full_messages}
        end
        
        def index
            render json: { users: User.all.map(&:as_json) }
        end
        
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
    end
  end