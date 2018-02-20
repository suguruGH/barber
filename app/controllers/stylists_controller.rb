class StylistsController < ApplicationController
    def index
      @stylists = Stylist.all
      @stylist = current_stylist
      @owner = current_owner
    end
  
    def new
      @stylist = Stylist.new
    end
    
    def show
      @stylist = Stylist.find(params[:id])
    end    
    
    def create
      @stylist = Stylist.new(stylist_params)
      if @stylist.save
        redirect_to new_stylist_session_path(@stylist.id)
      else
        render 'new'
      end
    end
    
    private
    def stylist_params
    params.require(:stylist).permit(:name, :email, :password,
                                 :password_confirmation,:image)
    end
end
