class Message < ApplicationRecord
  after_create_commit :broadcast_message

  belongs_to :user



  private

  def broadcast_message
    BroadcastMessageJob.perform_later(self)
  end

end
