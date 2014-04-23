class EventsController < ApplicationController
  # def index
  #   @events = Event.all
  #   @events_by_date = @events.group_by { |event| event.date_time.to_date }
  #   # binding.pry
  #   # @events_by_date[@events.first.date_time.day]
  #   @date = params[:date] ? Date.parse(params[:date]) : Date.today

  # end

  # def show
  #   @event = event.find(params[:id])
  # end

  # def new
  #   @event = event.new
  # end

  # def create
  #   @event = event.new(params[:event])
  #   if @event.save
  #     redirect_to @event, notice: "Created event."
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @event = event.find(params[:id])
  # end

  # def update
  #   @event = event.find(params[:id])
  #   if @event.update_attributes(params[:event])
  #     redirect_to @event, notice: "Updated event."
  #   else
  #     render :edit
  #   end
  # end

#   def show
#     @event = Event.find params[:id]
#     render json: @event
#   end

#   def create
#     @event = Event.new(event_params)

#     if @event.save
#       render json: @event# status: :created, location: events_id(@events)
#     else
#       head :unprocessable_entity
#     end
#   end

#   def update
#     @event = Event.find params[:id]
#     if @event
#       if @event.update_attributes(event_params)
#         head :no_content
#       else
#         head :unprocessable_entity
#       end
#     else
#       head :not_found
#     end
#   end

#   def destroy
#     @event = Event.find params[:id]

#     if @event
#       if @event.destroy
#         head :no_content
#       else
#         head :internal_server_error
#       end
#     else
#       head :not_found
#     end
#   end


#   private

#   def event_params
#     params.require(:event).permit(:title, :date_time, :user_id)
#   end
end