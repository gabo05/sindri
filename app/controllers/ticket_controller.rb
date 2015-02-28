class TicketController < ApplicationController
	include TicketHelper
    def index
    	@user = YAML.load(session[:user])
        
        all_tickets = get_tickets_for(@user)

        @pagination = Pagination.new params[:page], params[:size], all_tickets
        
        @tickets = @pagination.get_records
    	@business = Business.where('id = ?', @user.business_id).first
    	@priorities = Priority.where('state = (1)::bit(1)')
        @categories = @business.categories
    end
    def create
    	data = params[:ticket]

    	open_ticket(data, params[:attachments], params)
    	flash[:message] = { 'type' => 'success', 'text' => "La ticket ha sido creada y enviada para aprobación" }
    	redirect_to url_for :controller => 'ticket', :action => 'index'
    end
    def ticket
        @ticket = Ticket.where('id = ? and state = (1)::bit(1)', params[:id]).first
        @responses = TicketsResponse.where('ticket_id = ?', @ticket.id)
        @user = YAML.load(session[:user])
        business = Business.where('id = ?', @user.business_id).first
        @agents = business.agents
        @states = business.states
        @state = @ticket.current_state
        @agent = @ticket.agents.first
    end
    def change
        @user = YAML.load(session[:user])
        ticket_state = TicketsState.new(params[:ticket_id], params[:state][:id], @user.id)
        ticket_state.save
        redirect_to url_for controller: 'ticket', action: 'ticket', id: params[:ticket_id]
    end
    def send_response
        data = params[:tickets_response]
        response = TicketsResponse.new data
        response.save
        redirect_to url_for controller: 'ticket', action: 'ticket', id: data[:ticket_id]
    end
    def asign
        user = YAML.load(session[:user])
        asignament = TicketsAgent.new params[:ticket_id], params[:agent][:id]
        
        if asignament.save
            state = State.where('"order" = 3 and state = (1)::bit(1)').first
            ticket_state = TicketsState.new(params[:ticket_id], state.id, user.id)
            ticket_state.save
        end
        redirect_to url_for controller: 'ticket', action: 'ticket', id: params[:ticket_id]
    end
end
