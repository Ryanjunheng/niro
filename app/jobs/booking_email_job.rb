class BookingEmailJob < ApplicationJob
  queue_as :default

  def perform(participation)
    # changing the method deliver_now to deliver_later, Active Job will automatically send this email asynchronously in the queue
    ParticipationMailer.booking_email(participation).deliver_later
  end
end