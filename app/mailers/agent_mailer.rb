class AgentMailer < ActionMailer::Base
  default from: "from@example.com"

  def agent_invitation(email, user)
  	@user = user
        
    @confirm_url = "http://localhost:3000/account/confirm/#{user.id}"
        
    mail(to: email, subject: 'Bienvenido a Sindri')
  end
end
