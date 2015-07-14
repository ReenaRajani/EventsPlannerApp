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

  attr_accessor :remember_token

  before_save { self.email_id = email_id.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_id ,:presence => true, :uniqueness => true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  VALID_PHONENO_REGEX = /\+?[0-9]{1,3}-?[0-9]{6,12}/
  validates :phone_no , :presence => true, format: {with: VALID_PHONENO_REGEX}
  has_and_belongs_to_many :events
  has_secure_password  
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user in the database for persistent sessions 
  def remember
    self.remember_token = User.new_token
    updated_attribute(:remember_digest, User.digest(remember_token))
  end

   # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
