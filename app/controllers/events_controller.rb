class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_by_date = @events.group_by { |event| event.date_time.to_date }
    # binding.pry
    # @events_by_date[@events.first.date_time.day]
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  end

  def show
    @event = event.find(params[:id])
  end

  def new
    @event = event.new
  end

  def create
    @event = event.new(params[:event])
    if @event.save
      redirect_to @event, notice: "Created event."
    else
      render :new
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
end