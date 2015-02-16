class AgentController < ApplicationController
    include AgentHelper
    include ApplicationHelper
    def index
        user = YAML.load(session[:user])
        all_agents = Business.agents(user.business_id)
        @pagination = Pagination.new params[:page], params[:size], all_agents
        @agents = pagination.get_records
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
        
        email = Email.where('agent_id = ? and state = (1)::bit(1)', agent.id).first
        account = Account.find_by email_id: email.id

        if params[:picture] != nil
            uploaded_io = params[:picture]
            upload_file_to(uploaded_io, Rails.root.join('public', 'uploads', uploaded_io.original_filename))
            account.picture = uploaded_io.original_filename
        end

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
        end
        account.save
    	redirect_to url_for(:controller => :agent, :action => :edit, :id => agent.id)
    end
end
