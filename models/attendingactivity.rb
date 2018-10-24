class AttendingActivity < ActiveRecord::Base
  belongs_to :groupactivity
  belongs_to :user
end