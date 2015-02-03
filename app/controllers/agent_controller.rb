class AgentController < ApplicationController
    def index
        
    end
    
    def create
    	invite_agent(params[:name], params[:email])
    end

    def edit
    	@agent = Agent.find_by id: params[:id]
    	@email = Email.find_by agent_id: params[:id]
    	@account = Account.find_by email_id @email.id
    end
    def save
    	redirect_to url_for(:controller => :agent, :action => :edit, :id => params[:email])
    end
end
