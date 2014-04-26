class EventsController < ApplicationController

  def index
    @events = Event.all
    @events_by_date = @events.group_by { |event| event.date_time.to_date }
    # binding.pry
    # @events_by_date[@events.first.date_time.day]
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  end

  def show
    @event = [ Event.find(params[:id]) ]
  end

  def new

  end

  def create

    user = User.find(params[:user_id])
    @event = user.events.new(event_params)
    if @event.save
      head :created
    else
      render text: 'Silly Rabbit, we have no Trix!', status: :unprocessable_entity
    end
  end

  def edit
    @event = event.find(params[:id])
  end

  def update
    @event = event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, notice: "Updated event."
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date_time)
  end
end