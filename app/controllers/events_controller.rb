class EventsController < ApplicationController
  include EventsHelper
  # before_action :authenticate_user!
  before_action :authenticate_user!, except: %i[show index]

  def index
    @events = Event.all
    @past_events = previous_events
    @upcoming_events = upcoming_events
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event '#{@event.name}' created!"
      redirect_to @event
    else
      flash[:alert] = 'Some error!'
      render 'new'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :user_id)
  end

  def previous_events
    Event.where('date < ?', Time.now)
  end

  def upcoming_events
    Event.where('date >= ?', Time.now)
  end
end
