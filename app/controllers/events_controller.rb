class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
  end

  def created

  end


  private

  def event_params
    params.require(:event).permit()
  end
end
