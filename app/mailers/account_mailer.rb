class AccountMailer < ActionMailer::Base
    default from: "san.gaby05@gmail.com"
    
    def confirm_account(user, email)
        @user = user
        
        @confirm_url = "http://localhost:3000/account/confirm/#{user.id}"
        
        mail(to: email, subject: 'Bienvenido a Sindri')
    end
end
