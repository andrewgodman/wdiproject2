class AttendingActivity < ActiveRecord::Base
  belongs_to :groupactivity
  belongs_to :user
  validates :group_activity_id, uniqueness: { scope: :user_id }

end