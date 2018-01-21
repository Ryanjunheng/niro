class ParticipationsController < ApplicationController

# User event participation methods
  def create
    @participation = Participation.new(participation_params)

    @event = Participation.find_by(event_id: params[:event_id])
    @customer = User.find(@participation.user_id)
    @host = User.find_by(id: params[:user_id])

    if @participation.save
      BookingEmailJob.perform_later(@participation)
      HostEmailJob.perform_later(@customer, @host, @event)

      redirect_to user_path(current_user.id)
    else
      redirect_to user_event_path(user_id: @participation.user_id, id: @participation.event_id)
      @flash = {error: "There was a problem submitting your missiong request, please try again"}
    end
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
    redirect_to request.referrer
  end

# Organization participation methods
  def org_create
    @participation = Participation.new(participation_params)
    if @participation.save
      redirect_to user_path(current_user.id)
    else
      redirect_to request.referrer
      @flash = {error: "There was a problem submitting your missiong request, please try again"}
    end
    
  end

  def show
    @participation = Participation.find(params[:id])
  end

  def complete
    @participant = Participation.find(params[:id])
    @participant.Completed!
    @participant.user.add_badge(@participant.event_id)
    @participant.user.add_points(@participant.event.allocated_points)
    redirect_to '/'
  end

  def fail
    @participant = Participation.find(params[:id])
    @participant.Failed!
    redirect_to '/'
  end

  def org_destroy
    @participation = Participation.find_by(user_id: current_user.id, event_id: params[:event_id])
    @participation.destroy
    redirect_to request.referrer
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :status)
  end
end
