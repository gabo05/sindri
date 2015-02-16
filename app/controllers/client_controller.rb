class ClientController < ApplicationController
    include ClientHelper
    def index
        user = YAML.load(session[:user])

        all_clients = Client.where('state = (1)::bit(1) and business_id = ?', user.business_id)
        
        @pagination = Pagination.new params[:page], params[:size], all_clients

        @clients = @pagination.get_records
    end
    
    def invite
    	invite_client(params[:first_name], params[:last_name], params[:email])
        flash[:message] = {'type'=>"info",'text' => "Una invitación ha sido enviada a #{params[:email]} para confirmar su cuenta"}
        redirect_to url_for controller: 'client', action: 'index'
    end
    def delete
        redirect_to url_for controller: 'client', action: 'index'
    end
    def edit
    	@client = Client.find_by id: params[:id]
        @email = Email.where('client_id = ? and state = (1)::bit(1)', @client.id).first
    	@account = Account.find_by email_id: @email.id
    end
    def save
        client = Client.find_by id: params[:client_id]
        
        client.first_name = params[:first_name]
        client.last_name = params[:last_name]
        client.phone_number = params[:phone_number]
        client.save

        email = Email.where('client_id = ? and state = (1)::bit(1)', client.id).first
        account = Account.find_by email_id: email.id

        if params[:picture] != nil
            uploaded_io = params[:picture]
            File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
                file.write(uploaded_io.read)
            end
            account.picture = uploaded_io.original_filename
        end

        if email.email != params[:email] && params[:email] != "" && params[:email] != nil
            #Disabled the old email, but not delete
            email.state = false
            email.save
            #Create new email
            email = Email.new
            email.email = params[:email]
            email.client = client
            email.save

            #Update email account
            account.email = email
        end
        account.save
    	redirect_to url_for(:controller => :client, :action => :edit, :id => client.id)
    end
end
