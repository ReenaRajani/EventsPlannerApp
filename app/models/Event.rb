# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  eventName  :string
#  occasion   :text
#  eventdate  :date
#  eventtime  :time
#  address    :string
#  invitation :string
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :guests

  validates :eventName, :eventdate, :eventtime, :address, :invitation,  presence: true

  validates_associated :users

end
