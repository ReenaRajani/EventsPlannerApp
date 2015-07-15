class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # save is successful
      flash[:success] = "Event successfully created"
      redirect_to @event
    else
      #save is not successful 
      render 'new'
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update

    @event = Event.find params[:id]
    redirect_to(root_url) unless @user == current_user
    if @event.update(event_params)
      flash[:success] ="Event successfully edited"
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    flash[:success] = "Event deleted successfully"
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:eventName, :occasion, :eventdate, :eventtime, :address, :invitation)
  end

end
