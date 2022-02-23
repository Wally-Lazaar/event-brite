class EventsController < ApplicationController
  def index
    @events = Event.all
  
    puts @user
  end
  def new
    @event = Event.new

  end
  def show
    @events = Event.find(params[:id])

  @id = params[:id]

  end

    def create
      @myevent = event_params
      @event = Event.new(title: @myevent[:title], description: @myevent[:description], location: @myevent[:location], duration: @myevent[:duration], start_date: @myevent[:start_date])
      @event.save

          if @event.save
            redirect_to event_path(@event.id)
            flash[:success]= "Ton évenement a bien été créé !"
          else
            render new_event_path
        end

  end
  def destroy
    @event = Event.find(params[:id])
   @event.destroy
 redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :duration)
  end
end
