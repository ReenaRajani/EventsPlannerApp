# == Schema Information
#
# Table name: guests
#
#  id          :integer          not null, primary key
#  name        :string
#  email_id    :text
#  phone_no    :string
#  rsvp_status :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Guest < ActiveRecord::Base
  belongs_to_many :events
end
