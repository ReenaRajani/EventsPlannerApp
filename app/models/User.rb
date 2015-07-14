# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email_id        :text
#  phone_no        :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  before_save { self.email_id = email_id.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_id ,:presence => true, :uniqueness => true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  has_and_belongs_to_many :events
  has_secure_password  
  
end
