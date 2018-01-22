class ParticipationMailer < ApplicationMailer
	def booking_email(participation)
		@participation = Participation.find_by(id: participation.id)
		@url = "http://localhost:3000/participations/#{@participation.id}"

		mail(to: @participation.user.email, subject: 'Your participation is booked!')
	end

	def host_email(customer, host, event)
		@customer = customer
		@host = host
		@event = event
		# @url to be added
		mail(to: @host.email, subject: 'A booking has been made!')
	end

end
