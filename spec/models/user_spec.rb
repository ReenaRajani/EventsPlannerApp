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

require 'rails_helper'

RSpec.describe User, :type => :model  do
  describe 'a user ' do  
    before do 
      @user = User.create FactoryGirl.build(:user).attributes
    end
 
    it 'has a valid email id ' do
      user= User.find(@user.id)
      expect(user.email_id).to_not eq nil
      expect(user.email_id.downcase).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end
    it 'has an invalid email id ' do
    end

  end
  
  
end
