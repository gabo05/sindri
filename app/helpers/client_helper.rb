module ClientHelper
    def asset_url asset
      "#{request.protocol}#{request.host_with_port}/images/#{asset}"
    end
	def invite_client(first_name, last_name, user_email)
		#Initialize models
        #Create client
        client = Client.new
        client.first_name = first_name
        client.last_name = last_name
        user = YAML.load(session[:user])
        client.business_id = user.business_id
        client.appointment = Appointment.first
        #Create email
        if client.save
            email = Email.new
            email.email = user_email
            email.client = client

            #Create user
            if email.save
                user = Account.new
                user.email = email
                password = 'Sindri01'
                user.passsword = AESCrypt.encrypt password, MY_CONFIG['encrypt_password']
                user.picture = 'avatar_default.png'
                if user.save
                    #Assign role
                    role = Role.where('default_to = 5 and state = (1)::bit(1)').first
                    account_role = AccountsRole.new
                    account_role.role = role
                    account_role.account = user
                    account_role.save
                    AgentMailer::agent_invitation(email.email, user).deliver
                    return true
                end
            end
        end
        return false
	end
    def get_clients
        return Client.find_all
    end
end
