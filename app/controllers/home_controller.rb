class HomeController < ApplicationController
    include HomeHelper
    include TicketHelper
    def index
	    if params[:id] != nil
	    	switch_business params[:id]
	    end
      	
      	@user = YAML.load(session[:user])

		size = params[:size].to_i == 0 ? 5 : params[:size].to_i
	    page = params[:page].to_i <= 0 ? params[:page].to_i : params[:page].to_i() -1
	    
	    all_tickets = get_tickets_for(@user)

	    no_records = all_tickets.count
	    no_pages = (no_records % size) > 0 ? no_records / size + 1 : no_records / size
	    flash[:no_pages] = no_pages
	    
	    @tickets = all_tickets#.limit(size).offset(page*size)
    end
    
    def about
    end
    
end
