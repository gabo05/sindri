module AgentHelper
    def asset_url asset
      "#{request.protocol}#{request.host_with_port}/images/#{asset}"
    end
	def invite_agent(first_name, last_name, user_email)
		#Initialize models
        #Create agent
        agent = Agent.new
        agent.first_name = first_name
        agent.last_name = last_name
        
        #Create email
        if agent.save
            email = Email.new
            email.email = user_email
            email.agent = agent

            #Create user
            if email.save
                user = Account.new
                user.email = email
                password = 'Sindri01'
                user.passsword = AESCrypt.encrypt password, MY_CONFIG['encrypt_password']
                user.picture = 'avatar_default.png'
                if user.save
                    #Assign Business
                    business_agent = BusinessesAgent.new
                    business_agent.business_id = YAML.load(session[:user]).business_id
                    business_agent.agent = agent
                    business_agent.save
                    #Assign role
                    role = Role.where('default_to = 4 and state = (1)::bit(1)').first
                    account_role = AccountsRole.new
                    account_role.role = role
                    account_role.account = user
                    account_role.save
                    #Send the email invitation
                    AgentMailer::agent_invitation(email.email, user).deliver
                    return true
                end
            end
        end
        return false
	end
    def get_agents
        return Agent.find_all
    end
end
