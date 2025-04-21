class EventMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.event_notif.subject
  #
  def event_notif
    @event = params[:event]
    @user = params[:user]

    mail(to: @user.email_address, subject: "Update for event: #{@event.name}")
  end
end
