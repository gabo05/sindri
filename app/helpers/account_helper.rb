module AccountHelper
    require 'digest/md5'

    def asset_url asset
      "#{request.protocol}#{request.host_with_port}/images/#{asset}"
    end
	def user_signup(agent_data, user_email, password)
		#Initialize models
        #Create agent
        agent = Agent.new(agent_data)
        #Create email
        if agent.save
            #Email Account
            email = Email.new(user_email, agent)
            #Create user
            if email.save
                user = Account.new(email, Digest::MD5.hexdigest(password))
                if user.save
                    #Assign the role
                    role = Role.where('default_to = 2').first
                    account_role = AccountsRole.new(user, role)
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
            if email_account != nil
                user = Account.where('email_id = ? and passsword = ? and state = (1)::bit(1)', email_account.id, Digest::MD5.hexdigest(password)).first

                if user!=nil && user.email_id == email_account.id && user.confirmed == '1'
                    id = user.is_agent? ? user.email.agent.id : user.email.client.id
                    #Load business
                    if user.is_agent?
                        businesses_agent = BusinessesAgent.where('agent_id = ? and state = (1)::bit(1)', id)
                        if businesses_agent != nil
                            business = Business.where('id = ? and state = true', businesses_agent.first().business_id).first
                            session[:businesses] = Business.where(:id => businesses_agent.select(:business_id)).to_yaml
                        end
                    else
                        client = Client.where('id = ? and state = (1)::bit(1)', id).first
                        business = Business.where('id = ? and state = true', client.business_id).first
                    end
                    #Load roles
                    roles_id = AccountsRole.where('account_id = ?', user.id).collect{ |ar| ar.role_id }
                    #return data
                    activeUser = ActiveUser.new id, user, business, roles_id
                    return { 'message' => 'success', 'data' => activeUser }
                else
                    return { 'message' => 'nopass' }
                end
            else
                return { 'message' => 'noemail' }
            end
        else
            return { 'message' => 'noemail' }
        end
	end
    def user_logout()
        session[:user] = nil;
        session[:businesses] = nil;
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
