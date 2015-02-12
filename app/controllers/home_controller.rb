class HomeController < ApplicationController
    include HomeHelper
    def index
      if params[:id] != nil
      	switch_business params[:id]
      end
    end
    
    def about
    end
    
end
