class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update]

	def index
	end

	def create
		user = User.new(user_params) 
		if user.save 
			 sign_in user
      		 redirect_to "/"
		else
			redirect_to "/sign_up"
		end
	end

	def show 
		
	end 

	def edit
		
	end

	def update
		

	end

	private

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :avatar, :remove_avatar)
	end

	def find_user
		@user = User.find(params[:id])
	end

	def remove_password(hash)
			if hash["password"] == ""
				hash.delete("password")
			end
			hash
	end

end
