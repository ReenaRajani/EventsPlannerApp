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
  has_and_belongs_to_many :events

  before_save { self.email_id = email_id.downcase }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email_id ,:presence => true, :uniqueness => true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
   VALID_PHONENO_REGEX = /\+?[0-9]{1,3}-?[0-9]{6,12}/
    validates :phone_no, :presence => true, format: {with: VALID_PHONENO_REGEX}
    validates :name, :presence => true

end
