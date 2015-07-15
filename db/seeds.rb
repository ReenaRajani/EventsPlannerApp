# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create!(name:  "Example User",
             email_id: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar" ,
             phone_no: +61-123456789)

10.times do |n|
  name  = Faker::Name.name
  email_id = "example-#{n+1}@railstutorial.org"
  password = "password"
  phone_no = +61-123456789
  User.create!(name:  name,
               email_id: email_id,
               password:              password,
               password_confirmation: password,
               phone_no: phone_no)
end