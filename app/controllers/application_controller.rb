class ApplicationController < ActionController::Base
	require 'active_user'
	require 'accounts_role'
	require 'business'
	
    protect_from_forgery
    before_filter :signed_user

    protected
        def allowed_whitout_business 
         [
            { :controller => 'setting', :action => 'first' },
            { :controller => 'business', :action => 'create' },
            { :controller => 'catalog', :action => 'add_areas' },
            { :controller => 'catalog', :action => 'add_categories' },
            { :controller => 'catalog', :action => 'add_states' }
        ]
        end
    private
        def is_allowed_wb? controller, action
            for awb in allowed_whitout_business
                if awb[:controller] == controller and awb[:action] == action
                    return true
                end
            end
            return false
        end
        def signed_user
            if session[:user] == nil
                redirect_to action: 'login', controller: 'account'
            end

            if session[:user] != nil
                @user = YAML.load(session[:user])

                query = "SELECT * from fnverifypermission(#{@user.user_id},'#{params[:controller]}','#{params[:action]}');"
                result = ActiveRecord::Base.connection.exec_query(query)

                if result.rows[0][2] != params[:controller] or result.rows[0][3] != params[:action]
                    redirect_to action: 'denied', controller: 'home'
                end
                if(@user.type == 'agent')
                    if(session[:businesses] != nil)
                        @businesses = YAML.load(session[:businesses])
                    elsif not is_allowed_wb?(params[:controller], params[:action])
                        redirect_to action: 'first', controller: 'setting'
                    end
                end
            end
        end
end
