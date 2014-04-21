class MessagesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @messages = @event.messages
    render json: @messages
  end
end