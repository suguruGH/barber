class UsersController < ApplicationController
    def index
      @users = User.all
      @user = current_user
      @stylist = current_stylist
    end

    def new
      @user = User.new
    end
    
    def show
      @user = User.find(params[:id])
    end    
    
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to new_user_session_path(@user.id)
      else
        render 'new'
      end
    end
    
    private
    def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image)
    end
end
