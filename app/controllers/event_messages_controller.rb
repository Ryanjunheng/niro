class EventMessagesController < ApplicationController

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
    @event_message.update(event_message_params)
    redirect_to request_referrer
  end

  def destroy
  end

  private

  def event_message_params
    params.require(:event_message).permit(:message, :user_id, :event_id)
  end
end
