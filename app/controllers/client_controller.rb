class ClientController < ApplicationController
    include ClientHelper
    def index
        size = params[:size].to_i == 0 ? 10 : params[:size].to_i
        
        page = params[:page].to_i <= 0 ? params[:page].to_i : params[:page].to_i() -1
        
        all_emails = Email.where('state = (1)::bit(1) and client_id is not null')
        
        no_records = all_emails.count

        no_pages = (no_records % size) > 0 ? no_records / size + 1 : no_records / size

        flash[:no_pages] = no_pages

        @emails = all_emails.limit(size).offset(page*size)

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
