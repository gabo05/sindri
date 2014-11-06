class HomeController < ApplicationController
    before_filter :signed_user
    
    def index
      
    end
    
    def about
    end
    
    def signed_user
        if session[:user] == nil
            redirect_to action: 'login', controller: 'login'
        end
    end
    
end
