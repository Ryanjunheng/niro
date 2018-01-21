class HostEmailJob < ApplicationJob
  queue_as :default

  def perform(customer, host, event)
    # changing the method deliver_now to deliver_later, Active Job will automatically send this email asynchronously in the queue
    ParticipationMailer.host_email(customer, host, event).deliver_later
  end
end