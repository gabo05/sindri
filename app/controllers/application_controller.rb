class ApplicationController < ActionController::Base
    protect_from_forgery
    before_filter :signed_user
    
    private
        def signed_user
            if session[:user] == nil
                redirect_to action: 'login', controller: 'login'
            end
        end
end
