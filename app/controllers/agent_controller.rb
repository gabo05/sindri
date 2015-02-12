class AgentController < ApplicationController
    include AgentHelper
    def index
        size = params[:size].to_i == 0 ? 10 : params[:size].to_i
        
        page = params[:page].to_i <= 0 ? params[:page].to_i : params[:page].to_i() -1
        
        all_emails = Email.where('state = (1)::bit(1) and agent_id is not null')
        
        no_records = all_emails.count

        no_pages = (no_records % size) > 0 ? no_records / size + 1 : no_records / size

        flash[:no_pages] = no_pages

        @emails = all_emails.limit(size).offset(page*size)

    end
    
    def invite
    	invite_agent(params[:first_name], params[:last_name], params[:email])
        flash[:message] = {'type'=>"info",'text' => "Una invitación ha sido enviada a #{params[:email]} para confirmar su cuenta"}
        redirect_to url_for controller: 'agent', action: 'index'
    end
    def delete
        redirect_to url_for controller: 'agent', action: 'index'
    end
    def edit
    	@agent = Agent.find_by id: params[:id]
        @email = Email.where('agent_id = ? and state = (1)::bit(1)', @agent.id).first
    	@account = Account.find_by email_id: @email.id
    end
    def save
        agent = Agent.find_by id: params[:agent_id]
        
        agent.first_name = params[:first_name]
        agent.last_name = params[:last_name]
        agent.save
        
        email = Email.where 'agent_id = ? and state = true', agent.id
        account = Account.find_by email_id: email.id

        if email.email != params[:email] && params[:email] != "" && params[:email] != nil
            #Disabled the old email, but not delete
            email.state = false
            email.save
            #Create new email
            email = Email.new
            email.email = params[:email]
            email.agent = agent
            email.save

            #Update email account
            account.email = email
            account.save
        end

    	redirect_to url_for(:controller => :agent, :action => :edit, :id => params[:email])
    end
end
