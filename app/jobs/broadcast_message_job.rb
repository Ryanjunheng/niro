class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render message
    # MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end
