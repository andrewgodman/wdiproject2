class GroupActivity < ActiveRecord::Base
  belongs_to :organiser, class_name: 'User', foreign_key: 'activity_organiser'
end