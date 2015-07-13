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

  has_and_belongs_to_many :events
  has_secure_password   
end
