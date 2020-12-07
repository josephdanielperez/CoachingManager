class ApplicationController < ActionController::Base
    ### HELPER_METHOD MAKES METHOD AVAILABLE TO VIEWS TOO ###
    helper_method :current_user, :authorize, :logged_in?, :is_users_appointment?

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end 
    end

    ### UNNECESSARY? ###
    def authorize
        if current_user.nil? 
            flash[:notice] = "You must be logged in to access this page."
            redirect_to login_path
        end
    end

    ### ALSO UNNECESSARY? ###
    def is_users_appointment?(appointment)
        current_user.id == appointment.user_id
    end

end