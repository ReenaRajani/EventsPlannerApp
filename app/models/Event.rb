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
end
