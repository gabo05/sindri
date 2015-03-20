class AccountController < ActionController::Base
    require 'digest/md5'
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
    def acchpassword

    end
    def ac_change_password

        user = YAML.load(session[:user])

        account = Account.where('id = ?', user.user_id).first

        if account.passsword == Digest::MD5.hexdigest(params[:oldpass])

            user = YAML.load(session[:user])

            user_chpass user, params[:newpass]

            flash[:message] = {'type' => 'success', 'text' => "Contraseña cambiada correctamente"}

            redirect_to controller: 'account', action: 'acchpassword'
        else
            flash[:message] = {'type' => 'danger', 'text' => "La contraseña no es correcta"}

            redirect_to controller: 'account', action: 'acchpassword'
        end
    end
    def chpassword
        cuser = YAML.load(session[:user])

        @user = Account.where('id = ?', cuser.user_id).first
    end
    def change_password
        user = YAML.load(session[:user])

        user_chpass user, params[:newpass]

        redirect_to controller: 'home', action: 'index'
    end

    def confirm
        confirm = user_confirm params[:id]
        session[:user] = confirm['data'].to_yaml

        redirect_to controller: 'account', action: 'chpassword'
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
