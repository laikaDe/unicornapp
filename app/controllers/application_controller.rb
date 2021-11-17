class ApplicationController < ActionController::Base

    before_action :authenticate_user!

#     helper_method :current_user, :logged_in?
    
#     def current_user
#         User.find(session[:user_id]) 
#     end
 
#    def logged_in?
#        !!current_user
#    end

end
