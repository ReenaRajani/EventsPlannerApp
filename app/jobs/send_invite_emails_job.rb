class SendInviteEmailsJob < ActiveJob::Base
  queue_as :default

  require "mandrill"

  def perform(event)
    # Do something later
    guests = event.guests
    if guests.count > 0 
      guests.each do |guest|
        {:email_id => guest.email_id}
      end
  end
end
