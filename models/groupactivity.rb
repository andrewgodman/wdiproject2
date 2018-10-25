class GroupActivity < ActiveRecord::Base
  has_many :attending_activities
  has_many :user, through: :attending_activities # creates GroupActivity.first.users  
  has_many :activity_categories
  belongs_to :organiser, class_name: 'User', foreign_key: 'activity_organiser'
end