module AgentHelper
    require 'digest/md5'

    def asset_url asset
      "#{request.protocol}#{request.host_with_port}/images/#{asset}"
    end
	def invite_agent(first_name, last_name, user_email, business_id)
		#Initialize models
        #Create agent or find if exist
        agent = Agent.find_by_email user_email

        if agent == nil
            agent = Agent.new
            agent.first_name = first_name
            agent.last_name = last_name
            agent.save
        
            #Create email
            email = Email.new
            email.email = user_email
            email.agent = agent

            #Create user
            if email.save
                user = Account.new
                user.email = email
                password = 'Sindri01'
                user.passsword = Digest::MD5.hexdigest(password)
                user.picture = 'avatar_default.png'
                if user.save
                    #Assign role
                    role = Role.where('default_to = 4 and state = (1)::bit(1)').first
                    account_role = AccountsRole.new
                    account_role.role = role
                    account_role.account = user
                    account_role.save
                    #Send the email invitation
                    AgentMailer::agent_invitation(email.email, user).deliver
                end
            end
        end
        #Assign Business
        business_agent = BusinessesAgent.new
        business_agent.business_id = business_id
        business_agent.agent = agent
        business_agent.save

        return true
	end
    def get_agents
        return Agent.find_all
    end
end
