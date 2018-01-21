class ParticipationsController < ApplicationController

  def create
    @participation = Participation.new(participation_params)

    @event = Participation.find_by(event_id: params[:event_id])
    @customer = User.find(@participation.user_id)
    @host = User.find_by(id: params[:user_id])

    if @participation.save
      ParticipationMailer.booking_email(@participation).deliver_now
      ParticipationMailer.host_email(@customer, @host, @event).deliver_now
      redirect_to user_path(current_user.id)
    else
      redirect_to user_event_path(user_id: @participation.user_id, id: @participation.event_id)
      @flash = {error: "There was a problem submitting your missiong request, please try again"}
    end
  end

  def show
    @participation = Participation.find(params[:id])
  end

  def complete
    @participant = Participation.find(params[:id])
    @participant.Completed!
    redirect_to '/'
  end

  def fail
    @participant = Participation.find(params[:id])
    @participant.Failed!
    redirect_to '/'
  end

  def destroy
    @participation = Participation.find_by(user_id: current_user.id, event_id: params[:event_id])
    @participation.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :status)
  end
end
