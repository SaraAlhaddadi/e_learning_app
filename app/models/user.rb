class User < ApplicationRecord
  has_many :courses, foreign_key: :instructor_id
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
end
