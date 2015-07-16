class GuestsController < ApplicationController
  def new
    @guest = Guest.new

  end

  def create
    params["email_id"].each_with_index do |email, i|
      @guest = Guest.new
      @guest.name = params["name"][i]
      @guest.email_id = email
      @guest.phone_no = params["phone_no"][i]
      if current_user.nil? || current_user.events.find( params[:event_id] ).nil?
        redirect_to(root_url) and return
      elsif @guest.save
        current_user.events.find( params[:event_id]).guests << @guest
      else
        render 'new' and return
      end
    end
    redirect_to event_path(params[:event_id])
  end

  def index
    @event = Event.find( params[:event_id] )
    # @guests = Guest.all
    @guests = current_user.events.find( params[:event_id]).guests
  end

  def show
    @event = Event.find( params[:event_id] )
    @guest = Guest.find(params[:id])
  end

  def edit
    @event = Event.find( params[:event_id] )
    @guest = Guest.find params[:id]
    # raise params.inspect
  end

  def update
    @event = Event.find( params[:event_id] )
    @guest = Guest.find params[:id]
    if current_user.nil? || current_user.events.find( params[:event_id] ).nil?
      redirect_to(root_url)
    elsif @guest.update(guest_params)
      flash[:success] ="Guest successfully edited"
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy
    guest = Guest.find params[:id]

    if current_user.nil? || current_user.events.find( params[:event_id] ).nil?
      # flash[:notice] = "Nope, not your thang!"
      redirect_to(root_url)
    else
      guest.destroy
      flash[:success] = "Guest deleted successfully"
      redirect_to event_guests_path
    end

  end
  private
  def guest_params
    params.require(:guest).permit(:name,:email_id, :phone_no)
  end
end
