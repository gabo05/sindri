class TicketController < ApplicationController
	include TicketHelper
    def index
    	@user = YAML.load(session[:user])
        
        all_tickets = get_tickets_for(@user)

        @pagination = Pagination.new params[:page], params[:size], all_tickets
        
        @tickets = @pagination.get_records
    	@business = Business.where('id = ?', @user.business_id).first
    	@priorities = Priority.where('state = (1)::bit(1)')
    end
    def create
    	data = params[:ticket]

    	open_ticket(data, params[:attachments])
    	flash[:message] = { 'type' => 'success', 'text' => "La ticket ha sido creada y enviada para aprobación" }
    	redirect_to url_for :controller => 'ticket', :action => 'index'
    end
    def ticket
        @ticket = Ticket.where('id = ? and state = (1)::bit(1)', params[:id]).first
        @responses = TicketsResponse.where('ticket_id = ?', @ticket.id)
        @user = YAML.load(session[:user])
        business = Business.where('id = ?', @user.business_id).first
        @agents = business.agents

        state = State.where('"order" = 2 and state = (1)::bit(1)').first

        ts = TicketsState.where('state_id = ? and ticket_id = ?', state.id, @ticket.id )

        if(ts.count == 0)
            ticket_state = TicketsState.new
            ticket_state.ticket_id = @ticket.id
            ticket_state.state_id = state.id
            ticket_state.change_by = @user.user_id
            ticket_state.save
        end
    end
    def send_response
        response = TicketsResponse.new
        data = params[:tickets_response]
        response.ticket_id = data[:ticket_id]
        response.account_id = data[:account_id]
        response.text = data[:text]
        response.save
        redirect_to url_for controller: 'ticket', action: 'ticket', id: data[:ticket_id]
    end
    def asign
        user = YAML.load(session[:user])

        asignament = TicketsAgent.new
        asignament.ticket_id = params[:ticket_id]
        asignament.agent_id = params[:agent_id]
        
        if asignament.save
            state = State.where('"order" = 3 and state = (1)::bit(1)').first

            ticket_state = TicketsState.new
            ticket_state.ticket_id = params[:ticket_id]
            ticket_state.state_id = state.id
            ticket_state.change_by = user.user_id
            ticket_state.save
        end
        redirect_to url_for controller: 'ticket', action: 'ticket', id: params[:ticket_id]
    end
end
