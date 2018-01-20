class EventsController < ApplicationController
  before_action :find_event, only: [:show, :update]
  before_action :check_login, only: [:new, :edit]

  def index
    @events = Event.where(host_id: params[:user_id], host_type:"User").order(created_at: :desc)
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
    @participation = Participation.find_by(user_id: current_user.id, event_id: @event.id)
    # @participants = @event.users
    @participants = Participation.where(event_id: @event.id)
    @event_messages = EventMessage.where(event_id: @event.id).order(created_at: :desc)
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_path(current_user.id)
    else
      p @event.errors
      render 'events/new'
      @error = {create: "You have failed to create the event, please try again"}
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to user_events_path(params[:host], params[:id])
  end


  private

  def check_login
    if !signed_in?
      redirect_to '/'
      @flash = {alert: "Please log in to access these facilities"}
    end
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:host_id, :host_type, :name, :description, :event_type, :status, :required_participants, :start_date, :end_date, :start_time, :end_time, :address, :city, :state, :country, :zip_code, {photos:[]})
  end
end
