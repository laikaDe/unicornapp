class UnicornsController < ApplicationController

    before_action :find_unicorn, only: [:show, :update, :edit, :destroy]


    def index
        @unicorns = current_user.unicorns.order("created_at DESC")
    end

    def rainbow
        @rainbow_unicorns = current_user.unicorns.rainbow
    end

    def new 
        @unicorn = Unicorn.new
    end

    def create
        @user = User.find(current_user.id)
        @unicorn = @user.unicorns.create(unicorn_params)

        if @unicorn.save
            redirect_to user_unicorns_path(current_user.id)
        else
            render 'new'
        end
        
    end

    def show
        unless current_user.id == @unicorn.user_id
            flash[:notice] = "You don't have access to that unicorn!"
            redirect_to user_unicorns_path(current_user.id)
            return
        end
    end

    def update

        if @unicorn.update(unicorn_params)
            redirect_to @unicorn
        else
            render 'edit'
        end
    end

    def edit 
    end

    def destroy
        @unicorn.destroy
        redirect_to user_unicorns_path(current_user.id)
    end

    private 


    def unicorn_params
        params.require(:unicorn).permit(:name, :age, :color, :personality, :quirks)
    end

    def find_unicorn
        @unicorn = Unicorn.find(params[:id])
    end
end
