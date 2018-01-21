class ParticipationsController < ApplicationController

  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      redirect_to user_path(current_user.id)
    else
      redirect_to user_event_path(user_id: @participation.user_id, id: @participation.event_id)
      @flash = {error: "There was a problem submitting your missiong request, please try again"}
    end
  end

  def show
  end

  def complete
    @participant = Participation.find(params[:id])
    @participant.Completed!
    @participant.user.add_badge(1)
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
