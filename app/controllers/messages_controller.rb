class MessagesController < ApplicationController
    protect_from_forgery with: :null_session

  def index
    @event = Event.find(params[:event_id])
    @messages = @event.messages.order(created_at: :asc)
  end

  def create
    @event = Event.find params[:event_id]
    if @event
      @message = Message.new(message_params)
      @event.messages << @message
      render json: @message
    else
      head :no_content
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :event_id, :content)
  end
end
