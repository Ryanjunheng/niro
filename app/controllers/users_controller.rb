class UsersController < Clearance::UsersController
	before_action :find_user, only: [:show, :edit, :update, :verify]

	def index
	end

	def create
		user = User.new(user_params)
		user.save
		user.errors
			 sign_in user
      		 redirect_to "/"
		# else
		# 	redirect_to "/"
		# end
	end

	def show
		@pending_org_feed = params[:pending_org_feed] ? params[:pending_org_feed].to_i : 1
  	@pending_user_feed = params[:pending_user_feed] ? params[:pending_user_feed].to_i : 1
		@pending_org = Organization.where(verification: 0).page(@pending_org_feed)
		@pending_user = User.where(verification: 0).page(@pending_user_feed)
		@user_upcoming_participation = Participation.includes(:event).where(status: 0, user_id: @user.id).order(:created_at)
		@user_completed_participation = Participation.includes(:event).where(status: 1, user_id: @user.id).order(:created_at)
		@host_events = Event.where(host_id: @user.id, host_type:"User").limit(6).order(created_at: :desc)
	end

	def edit

	end

	def update
		@user.update(user_params)
		redirect_to @user
	end

	def verify
		@user.Verified!
		redirect_to @user
	end

	private

	def user_params
		params.require(:user).permit(:full_name, :sash_is, :email, :password, :phone, :intro, :city, :state, :country, :fb_link, :linkedin_link, :twitter_link, :avatar, :remove_avatar, {documents: []}, :remove_documents)
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
