class UsersController < ApplicationController

    before_action :authorized, only: [:auto_login]

    def index
      @users = User.all

      render json: @users

    end

    def show
      render json: @user
    end

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: unprocessable_entity
      end
    end
    
  
    # LOGGING IN
    def login
      @user = User.find_by(firstName: params[:firstName])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    def destroy
      @user.destroy
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
      params.permit(:firstName, :lastName, :password, :mail)
    end

end
