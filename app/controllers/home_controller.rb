class HomeController < ApplicationController
    include HomeHelper
    include TicketHelper
    def index
	    if params[:id] != nil
	    	switch_business params[:id]
	    end
      	
      	@user = YAML.load(session[:user])

	    all_tickets = get_tickets_for(@user)
	    @pagination = Pagination.new params[:page], 6, all_tickets

	    @tickets = @pagination.get_records
    end
    
    def about
    end
    
end
