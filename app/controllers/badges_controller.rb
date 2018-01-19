class BadgesController < ApplicationController

  def create
    @badge = Badge.new(params_badge)
    if @badge.save
      redirect_to user_event_path(id: params[:event_id])
    else
      redirect_to user_event_path(id: params[:event_id])
      @flash = {error: "failed to create badge, please try again"}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_badge
    params.require(:badge).permit(:event_id, :name, :description, :image)
  end

end
