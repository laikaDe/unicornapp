class SessionsController < ApplicationController

    # in charge of loggin user in/out & oumniauth
    # creating or destroying a sesssion

    # skip_before_action :verified_user, only: [:new, :create]

    def omniauth
        User.find_by_or_create_by(uid: auth['uid'], provider: auth['provider']) do  |u|
            u.username = auth['info']['first_name']
            u.email = auth['info'['email']
            
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

    def google
        @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
            user.password =  SecureRandom.hex(10)
        end 
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to movies_path 
        else 
            redirect_to new_user_path
        end 
    end 

    
    private 

    def auth
        request.env['omniauth.auth']
    end 

    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
