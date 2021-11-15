class SuperpowersController < ApplicationController

    def create
		@unicorn = Unicorn.find(params[:unicorn_id])
	 	@superpower = @unicorn.superpowers.create(params[:superpower].permit(:type, :description))
		redirect_to unicorn_path(@unicorn)	
	end

	def show
		byebug
		@unicorn = Unicorn.find(params[:id])
		@superpower = @unicorn.superpowers.find(params[:id])
		@superpower = @unicorn.superpowers.create(params[:superpower].permit(:type, :description))
	end

    def destroy
		@unicorn = Unicorn.find(params[:unicorn_id])
		@superpower = @unicorn.superpowers.find(params[:id])
		@superpower.destroy
		redirect_to unicorn_path(@unicorn)
	end


end
