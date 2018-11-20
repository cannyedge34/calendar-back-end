class EventsController < ApplicationController
  # app/controllers/events_controller.rb

  # GET /events
  def index
    @events = Event.all
    json_response(@events)
  end

  # POST /events
  def create
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  private

  def event_params
    # whitelist params
    params.permit(:title, :description, :start_date, :end_date)
  end
end
