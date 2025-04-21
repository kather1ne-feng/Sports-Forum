class UnrsvpsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_rsvp

  def show
    @rsvp&.destroy
    redirect_to root_path, notice: "Unsubscribed successfully."
  end

  private

  def set_rsvp
    @rsvp = Rsvp.find_by_token_for(:unrsvp, params[:token])
  end
end
