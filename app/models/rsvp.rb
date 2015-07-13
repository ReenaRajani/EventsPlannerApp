# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ActiveRecord::Base
  
end
