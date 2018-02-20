class OwnerSessionsController < ApplicationController
  def new
  end
  
  def create
    owner = Owner.find_by(email: params[:session][:email].downcase)
      if owner && owner.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:owner_id] = owner.id
      redirect_to owners_path
      else
        flash.now[:danger] = 'ログインに失敗しました'
          render 'new'
      end
  end
  
  def destroy
    session.delete(:owner_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_owner_session_path
  end 
end
