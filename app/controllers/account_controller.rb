
class AccountController < ActionController::Base
    layout "unsignup"
    include AccountHelper
    
    def login
    end
    
    def register
    end
    
    def create
        if(user_signup(params[:first_name], params[:last_name], params[:email], params[:password]))
            @message = {'type' => 'success', 'text' => 'Su cuenta ha sido creada. Un correo electr&oacute;nico ha sido enviado a su correo #{email.email} para confirmar su cuenta'}
            redirect_to url_for(:controller => :account, :action => :login)
        end
    end
    
    def signin
        account = params[:account]
        sigin_result = user_signin(account[:email], account[:password]);

        if(sigin_result == 'success')
            redirect_to url_for(:controller => :home, :action => :index)
        elsif (sigin_result == 'nopass')
            @message = {'type' => 'danger', 'text' => 'Contrase&ntilde;a inv&aacute;lida'}
            redirect_to url_for(:controller => :account, :action => :login)
        else
            @message = {'type' => 'danger', 'text' => 'Direcci&oacute;n de correo electr&oacute;nico no v&aacute;lida'}
            redirect_to url_for(:controller => :account, :action => :login)
        end
    end
end
