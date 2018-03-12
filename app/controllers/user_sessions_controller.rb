class UserSessionsController < ApplicationController
  def new
    puts notice
  end
  
  def create
    # binding.pry
    user = User.find_by(email: params[:session][:email].downcase)
    # binding.pry
      if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
        flash[:notice] = 'ログインしました'
        session[:user_id] = user.id
        # binding.pry
        redirect_to shares_path
      else
        flash.now[:danger] = 'ログインに失敗しました'
          render 'new'
      end
  end
  
  def destroy
    # binding.pry
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
