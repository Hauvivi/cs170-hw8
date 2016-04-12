class VisitsController < ApplicationController
	#GET /:tag
	def new_visit
	@location = Location.find by(tag: params[:tag])
	end

	#POST /:tag
	def create_visit
	@user = User.find by(email: params[:email])
	@location = Location.find by (tag: params[:tag])
	
    @user.visited_locations << @location
	
	redirect _to show_user_path(@user)
    end
end
