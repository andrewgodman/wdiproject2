class ActivityCategory < ActiveRecord::Base
  has_many :group_activities
end