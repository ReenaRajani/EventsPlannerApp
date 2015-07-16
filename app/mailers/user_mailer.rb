class UserMailer < ApplicationMailer
  default from: "reena_hrajani@yahoo.co.in"

  def invite_guest(guest)
    @guest = guest
    mail(to: @guest.email_id subject: "You are Invited ")
  end
end
