class CalendarsController < ApplicationController

  layout 'empty'

  def show
    @events = Event.all
    @events_by_date = @events.group_by { |event| event.date_time.to_date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
