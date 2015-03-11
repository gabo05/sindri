class HomeController < ApplicationController
    include HomeHelper
    include TicketHelper
    def index
	    if params[:id] != nil
	    	switch_business params[:id]
	    end

      all_tickets = get_tickets_for(@user)

      if params[:ticket_id] != nil
        all_tickets = Ticket.where('id = ?', params[:ticket_id])
      end
      @user = YAML.load(session[:user])

	    
	    @pagination = Pagination.new params[:page], 6, all_tickets

	    @tickets = @pagination.get_records
    end
    
    def about
    end
    
end
