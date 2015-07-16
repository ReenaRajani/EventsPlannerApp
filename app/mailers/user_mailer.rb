class UserMailer < ApplicationMailer
  default from: "reena_hrajani@yahoo.co.in"

  def invite_guest(guest, event, current_user, url)
    @guest = guest
    @event = event
    @current_user = current_user
    @url = url
    mail(to: @guest.email_id, subject: "You are Invited ")
  end
end
