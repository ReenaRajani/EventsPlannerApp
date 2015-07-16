class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    # @events = Event.all 
    @events = current_user.events
  end

  def mail
    event = Event.find( params[:event_id] )
    details = JSON.parse params[:details]
    url = request.env["HTTP_ORIGIN"]

    details.each do |user|
      guest = Guest.find_by :email_id => "hello@hello.com"
      UserMailer.invite_guest( guest, event, current_user, url ).deliver_now
      binding.pry
    end

    render :json => { status: "200 OK" }
  end

  def rsvp
    
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # save is successful
      current_user.events << @event
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
    if current_user.nil? || current_user.events.find( params[:id] ).nil?
      redirect_to(root_url)
    elsif @event.update(event_params)
      flash[:success] ="Event successfully edited"
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy
    event = Event.find params[:id]

    if current_user.nil? || current_user.events.find( params[:id] ).nil?
      # flash[:notice] = "Nope, not your thang!"
      redirect_to(root_url)
    else
      event.destroy
      flash[:success] = "Event deleted successfully"
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    #raise params.inspect
    params.require(:event).permit(:eventName, :occasion, :eventdate_time, :address, :invitation)
  end

end
