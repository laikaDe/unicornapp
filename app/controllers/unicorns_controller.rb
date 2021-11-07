class UnicornsController < ApplicationController

    def index
    end

    def new 
        #1. Calls unicorn model 
        #2. Tells it to create new unicorn
        @unicorn = Unicorn.new
    end

    def create 
        @unicorn = Unicorn.new(unicorn_params)

        if @unicorn.save
            redirect_to @unicorn
        else
            render 'new'
        end
    end

    private 

    def unicorn_params
        params.require(:unicorn).permit(:name, :age, :color, :personality, :quirks)
    end
end
