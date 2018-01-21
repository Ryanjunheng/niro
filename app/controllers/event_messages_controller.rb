class EventMessagesController < ApplicationController

# user method
  def create
    @event_message = EventMessage.new(event_message_params)
    if @event_message.save
      redirect_to request.referrer
    else
      redirect_to '/'
      @flash = {error: "there was a problem creting your event message, please try again"}
    end
  end

  def update
    @event_message = EventMessage.find_by(user_id:current_user.id, event_id:params[:event_id], id:params[:id])
    @event_message.update(event_message_params)
    redirect_to request.referrer
  end

  def destroy
    @event_message = EventMessage.find_by(user_id:current_user.id, event_id:params[:event_id], id:params[:id])
    @event_message.destroy
    redirect_to request.referrer
  end

# organization method
  def org_create
    @event_message = EventMessage.new(event_message_params)
    if @event_message.save
      redirect_to request.referrer
    else
      redirect_to '/'
      @flash = {error: "there was a problem creting your event message, please try again"}
    end
  end

  def org_update
    @event_message = EventMessage.find_by(user_id:current_user.id, event_id:params[:event_id], id:params[:id])
    @event_message.update(event_message_params)
    redirect_to request.referrer
  end

  def org_destroy
    @event_message = EventMessage.find_by(user_id:current_user.id, event_id:params[:event_id], id:params[:id])
    @event_message.destroy
    redirect_to request.referrer
  end

  private

  def event_message_params
    params.require(:event_message).permit(:message, :user_id, :event_id)
  end
end
