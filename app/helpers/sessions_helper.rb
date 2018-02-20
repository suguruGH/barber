module SessionsHelper
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    def logged_in?
      !current_user.nil?
    end

    def current_stylist
      @current_stylist ||= Stylist.find_by(id: session[:stylist_id])
    end
    def logged_in?
      !current_stylist.nil?
    end
 
    def current_owner
      @current_owner ||= Owner.find_by(id: session[:owner_id])
    end
    def logged_in?
      !current_owner.nil?
    end
end
