class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def cities
  	render json: CS.cities(params[:state], :my).to_json
  end
end