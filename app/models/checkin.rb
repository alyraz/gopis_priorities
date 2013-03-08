class Checkin < ActiveRecord::Base
  belongs_to :user
  #validates_presence_of :????
end
