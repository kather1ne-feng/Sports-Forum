class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  allow_unauthenticated_access only: %i[ index show ]

  def index
    @events = Event.all
    if params[:sport_types].present?
      @events = @events.where(sport_type: params[:sport_types])
    end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render partial: "events/events_list", locals: { events: @events }
      end
    end
  end


  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    @event = Current.user.events.build(event_params)
    if @event.save
      flash[:notice] = "Event created successfully."
      redirect_to @event
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event updated successfully."
      redirect_to @event
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.expect(event: [ :name, :description, :featured_image, :event_time, :sport_type, :location ])
    end
end
