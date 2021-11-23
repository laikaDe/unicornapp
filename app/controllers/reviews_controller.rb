class ReviewsController < ApplicationController

    before_action :find_superpower
    before_action :find_review, only: [:edit, :update, :destroy]
    before_action :find_unicorn
    
    def index
        byebug
    end

    def new 
        @review = Review.new
    end

    def create 
        @review = Review.new(review_params)
        @review.superpower_id = @superpower.id
        @review.unicorn_id = current_user.id
        if @review.save
            redirect_to user_unicorn_path(current_user.id, @unicorn.id)
        else
            render 'new'
        end
    end

    def edit
    end

    def update 

        if @review.update(review_params)
            redirect_to user_unicorn_path(current_user.id, @unicorn.id)
        else
            render 'edit'
        end
    end

    def destroy
        @review.destroy
        redirect_to user_unicorn_path(current_user, @unicorn.id)	
    end

    private

    def find_unicorn
        @unicorn = Unicorn.find(params[:unicorn_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def find_superpower
        @superpower = Superpower.find(params[:superpower_id])
    end

    def review_params 
        params.require(:review).permit(:rating, :comment)
    end

end
