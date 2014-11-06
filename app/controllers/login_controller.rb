class LoginController < ApplicationController
    layout "unsignup"
    
    def login
    end
    
    def signin
        session[:user] = "yes"
        
        redirect_to url_for(:controller => :home, :action => :index)
    end
end
