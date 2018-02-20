class StylistSessionsController < ApplicationController
  def new
  end
  
  def create
    stylist = Stylist.find_by(email: params[:session][:email].downcase)
      if stylist && stylist.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:stylist_id] = stylist.id
      redirect_to stylists_path
      else
        flash.now[:danger] = 'ログインに失敗しました'
          render 'new'
      end
  end
  
  def destroy
    session.delete(:stylist_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_stylist_session_path
  end
end
