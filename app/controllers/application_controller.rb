class ApplicationController < ActionController::Base
	require 'active_user'
	require 'accounts_role'
	require 'business'
	
    protect_from_forgery
    before_filter :signed_user
    
    private
        def signed_user
            if session[:user] == nil and session[:agent_id] == nil
                redirect_to action: 'login', controller: 'account'
            elsif session[:user] != nil and session[:new_agent_id] == nil
                @user = YAML.load(session[:user])
                if(@user.type == 'agent')
                    if(session[:businesses] != nil)
                        @businesses = YAML.load(session[:businesses])
                    else
                        redirect_to action: 'first', controller: 'setting'
                    end
                end
            end
        end
end
