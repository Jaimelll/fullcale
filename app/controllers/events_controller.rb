class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    case current_user.categoria
    when 1,2
        @events = Event.where(start: params[:start]..params[:end])
    when 3
        @events = Event.where(start: params[:start]..params[:end]).where(estado:1)

   end
 end


  def show
  end

  def new
    @event = Event.new

  end

  def edit
  end


  def create
    @event = Event.new(event_params)
  #  @event = current_user.events.new(event_params)

    @event.user_id=current_user.id

      case current_user.categoria
        when 1
           @event.color='black'
           @event.estado=1
           @event.save
        when 2
           @event.color='green'
           @event.estado=2
           @event.save
       end
  end


  def update


    case current_user.categoria
      when 1
         @event.update(event_params)
         @event.update(color:'black',estado:1)
      when 2
         if  @event.estado==2 then
          @event.update(event_params)
          @event.update(color:'green',estado:2)
        end
      end

  end






  def destroy

    case current_user.categoria
      when 1
        @event.destroy
      when 2
        @event.where(estado:2).destroy
      end
  end



  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :estado, :user)
    end
end
