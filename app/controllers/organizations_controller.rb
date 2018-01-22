class OrganizationsController < ApplicationController
	before_action :find_organization, only: [:show, :edit, :update, :verify]

	def index
	end

	def new 
	end

	def create
		@organization = Organization.new(organization_params)
    	if @organization.save
      		redirect_to user_path(current_user.id)
    	else
      		p @organization.errors
      		render 'organizations/new'
      		@error = {create: "You have failed to create the organization, please try again"}
    	end
	end

	def show
		@host_events = Event.where(host_id: @organization.id, host_type:"Organization").limit(6).order(created_at: :desc)
	end

	def edit
	end

	def update
		@organization.update(organization_params)
		redirect_to @organization
	end

	def verify
		@organization.Verified!
		redirect_to @organization 
	end


	private

	def organization_params
		params.require(:organization).permit(:user_id, :name, :email, :registration_number, :phone, :address, :city, :state, :country, :zip_code, :logo, :remove_logo, {documents: []}, :remove_documents, :verification)
	end

	def find_organization
		@organization = Organization.find(params[:id])
	end
end
