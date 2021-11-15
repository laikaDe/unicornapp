class UnicornsController < ApplicationController

    before_action :find_unicorn, only: [:show, :update, :edit, :destroy]

    def index
        @unicorns = Unicorn.all.order("created_at DESC")
    end

    def new 
        #1. Calls unicorn model 
        #2. Tells it to create new unicorn
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
        redirect_to user_unicorn_path(current_user.id, @unicorn)
    end

    private 

    def unicorn_params
        params.require(:unicorn).permit(:name, :age, :color, :personality, :quirks)
    end

    def find_unicorn
        @unicorn = Unicorn.find(params[:id])
    end
end
