class ApplicationController < ActionController::Base
	require 'active_user'
	require 'accounts_role'
	require 'business'
	
    protect_from_forgery
    before_filter :signed_user
    
    private
        def signed_user
            if session[:user] == nil
                redirect_to action: 'login', controller: 'account'
            else
                @user = YAML.load(session[:user])
                if(@user.type == 'agent')
                    @businesses = YAML.load(session[:businesses])
                end
            end
        end
end
