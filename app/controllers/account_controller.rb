class AccountController < ActionController::Base
    layout "unsignup"
    
    def login

    end
    
    def register
        
    end
    
    def create
        
        #Initialize models
        
        #Create agent
        agent = Agent.new
        
        agent.first_name = params[:first_name]
        
        agent.last_name = params[:last_name]

        #Create email
        
        if agent.save

            email = Email.new

            email.email = params[:email]

            email.agent = agent

            #Create user
            if email.save
                
                user = Account.new
                
                user.email = email
                
                user.passsword = AESCrypt.encrypt params['password'], MY_CONFIG['encrypt_password']
                
                if user.save

                    AccountMailer::confirm_account user, email.email

                    @message = {'type' => 'success', 'text' => 'Su cuenta ha sido creada. Un correo electr&oacute;nico ha sido enviado a su correo #{email.email} para confirmar su cuenta'}

                end
            end
        end
        
        redirect_to url_for(:controller => :account, :action => :login)
        
    end
    
    def signin

        email = Email.find_by email: params[:email]

        if(email != nil)

            user = Account.find_by password: AESCrypt.decrypt(params[:password], MY_CONFIG['encrypt_password'])

            if user!=nil && user.email.id == email.id

                id = user.is_agent ? email.agents_id : email.clients_id

                session[:user] = {'full_name' => user.full_name, 'user_id' => user.id, 'type' => user.type}

                redirect_to url_for(:controller => :home, :action => :index)
            else
                @message = {'type' => 'danger', 'text' => 'Contrase&ntilde;a inv&aacute;lida'}

                redirect_to url_for(:controller => :account, :action => :login)
            end
        else
            @message = {'type' => 'danger', 'text' => 'Direcci&oacute;n de correo electr&oacute;nico no v&aacute;lida'}

            redirect_to url_for(:controller => :account, :action => :login)
        end
        
    end
end
