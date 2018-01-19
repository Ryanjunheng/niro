class FollowingsController < ApplicationController

	def follow
		@user = User.find_by(id: params[:id])
		@follow = Following.create(follower_id: current_user.id, followed_id: @user.id)
		redirect_to "/users/#{@user.id}"
	end

	def unfollow
		@user = User.find_by(id: params[:id])
		@follow = Following.where(follower_id: current_user.id, followed_id: @user.id)
		@follow.destroy_all
		redirect_to "/users/#{@user.id}"
	end
end
