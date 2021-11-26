class SessionsController < ApplicationController

    # in charge of loggin user in/out & oumniauth
    # creating or destroying a sesssion

    # skip_before_action :verified_user, only: [:new, :create]

    def omniauth
        
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do  |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
        
        if user.valid?
            sign_in_and_redirect user
        else
            flash[:message] = user.errors.full_messages.join(" ,")
            redirect_to root_path
        end      
    end

    def signup
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to movies_path
        else 
            @error = @user.errors.full_messages
            render :signup
        end 
    end

    def logout 
        session.clear
        redirect_to root_path
    end 
 
    def auth
        request.env['omniauth.auth']
    end 
end
