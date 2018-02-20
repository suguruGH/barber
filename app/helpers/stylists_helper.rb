module StylistsHelper
    def current_stylist
      @current_stylist ||= Stylist.find_by(id: session[:stylist_id]) # ||= はnilかfalseの意味
    end
    
    def logged_in?
      !current_stylist.nil?
    end
end
