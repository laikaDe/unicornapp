class SuperpowersController < ApplicationController

    def create
		@unicorn = Unicorn.find(params[:unicorn_id])
	 	@superpower = @unicorn.superpowers.create(params[:superpower].permit(:type, :description))
		redirect_to user_unicorn_path(current_user.id, @unicorn)	
	end

	def new
		@unicorn = Unicorn.find(params[:unicorn_id])
	end

    def destroy
		@unicorn = Unicorn.find(params[:unicorn_id])
		@superpower = @unicorn.superpowers.find(params[:id])
		@superpower.destroy
		redirect_to user_unicorn_path(current_user.id, @unicorn)
	end
end
