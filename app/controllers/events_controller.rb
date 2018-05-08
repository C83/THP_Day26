class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @list_events = Event.all
    @list_past_events = Array.new
    @list_future_events = Array.new
    @list_events.each do |event|
      if (event.date - Time.now > 0)
        # la date de l'évènement est future
        @list_future_events.push(event)
      else
        @list_past_events.push(event)
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @this_event = Event.find_by(params.permit(:id))
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if current_user
      @event = Event.new(params.require(:event).permit(:description, :place, :date))
      @event.creator = current_user

      # Code généré par le generate scaffold
      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "You should be connected to create a event."
      redirect_to new_event_path
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def subscribe
    e = Event.find_by_id(params[:event].to_i)
    if (e.attendees.find_by_id(current_user.id))
      flash[:danger] = "You are already attendeed"
      redirect_to e
    else 
      e.attendees << current_user
      flash[:success] = "Subscribe done"
      redirect_to e
    end

  end

  private
    # Nous avons compris tard l'utilité de ces fonctions, couplée au before_action
    # Dans certaines fonctions comme Show, le travail est donc fait "deux fois" 
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :date, :place)
    end
end