module AccountHelper
    def asset_url asset
      "#{request.protocol}#{request.host_with_port}/images/#{asset}"
    end
	def user_signup(first_name, last_name, business_name, user_email, password)
		#Initialize models
        #Create agent
        agent = Agent.new   
        agent.first_name = first_name
        agent.last_name = last_name

        #Create Business
        business = Business.new
        business.name = business_name
        business.logo = 'avatar_default.png'

        #Create email
        if agent.save && business.save
            #Save BusinessAgent
            business_agent = BusinessesAgent.new
            business_agent.agent_id = agent.id
            business_agent.business = business

            #Email Account
            email = Email.new
            email.email = user_email
            email.agent = agent

            #Create user
            if email.save && business_agent.save
                user = Account.new
                user.email = email
                user.passsword = AESCrypt.encrypt password, MY_CONFIG['encrypt_password']
                user.picture = 'avatar_default.png'
                if user.save
                    #Assign the role
                    role = Role.where('default_to = 2').first
                    account_role = AccountsRole.new
                    account_role.role = role
                    account_role.account = user
                    account_role.save
                    #Send the email confirmation
                    AccountMailer.confirm_account(user, email.email).deliver
                    return true
                end
            end
        end
        return false
	end
	def user_signin(email, password)
		if(email != nil)
            #Find matched user and password
			email_account = Email.where('email = ? and state = (1)::bit(1)', email).first
            user = Account.where('email_id = ? and passsword = ? and state = (1)::bit(1)', email_account.id, AESCrypt.encrypt(password, MY_CONFIG['encrypt_password'])).first

            if user!=nil && user.email_id == email_account.id && user.confirmed == '1'
                id = user.is_agent? ? user.email.agent.id : user.email.client.id
                #Load business
                if user.is_agent?
                    businesses_agent = BusinessesAgent.where('agent_id = ? and state = (1)::bit(1)', id)
                    business = Business.where('id = ? and state = true', businesses_agent.first().business_id).first
                    session[:businesses] = Business.where(:id => businesses_agent.select(:business_id)).to_yaml
                else
                    client = Client.where('id = ? and state = (1)::bit(1)', id).first
                    business = Business.where('id = ? and state = true', client.business_id).first
                end
                #Load roles
                roles = AccountsRole.where('account_id = ?', user.id).select(:role_id).map(&:attributes)
                roles_id = Array.new
                roles.each { |rol| roles_id.push(rol["role_id"])}
                #return data
                activeUser = ActiveUser.new id, user, business, roles_id
                return { 'message' => 'success', 'data' => activeUser }
            else
                return { 'message' => 'nopass' }
            end
        else
            return { 'message' => 'noemail' }
        end
	end
    def user_logout()
        session[:user] = nil;
    end
    def user_confirm(user_id)
        user = Account.find_by id: user_id
        user.confirmed = 1
        user.save
        #session[:user] = {'full_name' => user.full_name, 'user_id' => user.id, 'type' => user.type}

        password = AESCrypt.decrypt(user.passsword, MY_CONFIG['encrypt_password'])

        email = Email.where('id = ? and state = (1)::bit(1)', user.email_id).first

        return user_signin(email.email, password)
    end
end
