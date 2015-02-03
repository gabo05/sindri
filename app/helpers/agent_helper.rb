module AgentHelper
	def invite_agent(name, user_email)
		#Initialize models
        #Create agent
        agent = Agent.new   
        agent.first_name = name

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
                if user.save
                    AgentMailer::send_agent_invitation email.email, user
                    return true
                end
            end
        end
        return false
	end
end
