module AccountHelper
	def user_signup(first_name, last_name, user_email, password)
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
                user.passsword = AESCrypt.encrypt password, MY_CONFIG['encrypt_password']
                if user.save
                    AccountMailer::confirm_account user, email.email
                    return true
                end
            end
        end
        return false
	end
	def user_signin(email, password)
		if(email != nil)
			email_account = Email.find_by email: 'san.gaby@hotmail.es'
            user = Account.find_by passsword: AESCrypt.encrypt(password, MY_CONFIG['encrypt_password'])

            if user!=nil && user.email.id == email_account.id && user.confirmed
                id = user.is_agent? ? user.email.agent.id : user.email.client.id
                session[:user] = {'full_name' => user.full_name, 'user_id' => user.id, 'type' => user.type}
                return 'success'
            else
                return 'nopass'
            end
        else
            return 'noemail'
        end
	end
    def user_logout()
        session[:user] = nil;
    end
end
