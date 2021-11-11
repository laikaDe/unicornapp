class SuperpowersController < ApplicationController

    def create
		@unicorn = Unicorn.find(params[:unicorn_id])
	 	@superpower = @unicorn.superpowers.create(params[:superpower].permit(:type, :description))
		redirect_to unicorn_path(@unicorn)	
	end

end
