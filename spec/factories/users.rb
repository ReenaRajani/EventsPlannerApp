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


FactoryGirl.define do 
  factory :user do |f| # different users for different user names 
    f.sequence(:email_id){|n| Faker::Internet.email}
    password "password"
    password_confirmation "password"
    f.sequence(:phone_no){|n| Faker::PhoneNumber.cell_phone}
    admin false
  end
end 