class AccountController < ActionController::Base
    protect_from_forgery
    layout "unsignup"
    include AccountHelper
    
    def login
    end
    
    def logout
        user_logout
        redirect_to url_for(:controller => :account, :action => :login)
    end
    
    def register
        
    end

    def confirm
        confirm = user_confirm params[:id]
        session[:user] = confirm['data'].to_yaml

        redirect_to url_for(:controller => confirm['data'].type, :action => :edit, :id => confirm['data'].id)
    end
    def create
        if(user_signup(params[:agent], params[:email], params[:password]))
            flash.keep
            flash[:message] = {'type' => 'success', 'text' => "Su cuenta ha sido creada. Un correo electrónico ha sido enviado a #{params[:email]} para confirmar su cuenta"}
            redirect_to url_for(:controller => :account, :action => :login)
        end
    end
    
    def signin
        account = params[:account]
        sigin_result = user_signin(account[:email], account[:password]);

        if(sigin_result['message'] == 'success')
            session[:user] = sigin_result['data'].to_yaml
            redirect_to url_for(:controller => :home, :action => :index)
        elsif (sigin_result['message'] == 'nopass')
            flash.keep
            flash[:message] = {'type' => 'danger', 'text' => 'Contraseña inválida'}
            redirect_to url_for(:controller => :account, :action => :login)
        else
            flash.keep
            flash[:message] = {'type' => 'danger', 'text' => 'Dirección de correo electrónico no válida'}
            redirect_to url_for(:controller => :account, :action => :login)
        end
    end
end
