module OwnersHelper
    def current_owner
      @current_owner ||= Owner.find_by(id: session[:owner_id]) # ||= はnilかfalseの意味
    end
    
    def logged_in?
      !current_owner.nil?
    end
end
