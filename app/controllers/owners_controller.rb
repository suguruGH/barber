class OwnersController < ApplicationController
    def index
      @owners = Owner.all
      @owner = current_owner
      @stylist = current_stylist
    end

    def new
      @owner = Owner.new
    end
    
    def show
      @owner = Owner.find(params[:id])
    end    
    
    def create
      @owner = Owner.new(owner_params)
      if @owner.save
        redirect_to new_owner_session_path(@owner.id)
      else
        render 'new'
      end
    end
    
    private
    def owner_params
    params.require(:owner).permit(:name, :email, :password,
                                 :password_confirmation, :image)
    end
end
