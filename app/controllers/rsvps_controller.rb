class RsvpsController < ApplicationController
  # allow_unauthenticated_access
  before_action :set_event

  def create
    # @event.rsvps.where(rsvp_params).first_or_create
    # redirect_to @event, notice: "You have RSVP'ed to this event."

    @rsvp = @event.rsvps.build(user: Current.user)

    if @rsvp.save
      redirect_to @event, notice: "You have RSVP'ed to this event."
    else
      redirect_to @event, alert: "Something went wrong oops"
    end
  end

  def destroy
    @rsvp = @event.rsvps.find_by(user: Current.user)

    if @rsvp&.destroy
      redirect_to @event, notice: "You’ve left the event."
    else
      redirect_to @event, alert: "Could not leave the event something went wrong"
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  # def rsvp_params
  #   params.expect(rsvp: [ :user ])
  # end
end
