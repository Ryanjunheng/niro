class RoomsController < ApplicationController
  before_action :require_login

  def show
    @messages = Message.order(created_at: :asc)
  end
end
