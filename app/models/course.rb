class Course < ApplicationRecord
  belongs_to :instructor, class_name: "User"
  has_many :lessons
  has_many :enrollments
  has_many :enrolled_users, through: :enrollments, source: :user
end
