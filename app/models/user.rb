class User < ApplicationRecord
  has_one_attached :avatar
  enum role: { student: 0, teacher: 1, admin: 2 }

  has_many :courses, foreign_key: :instructor_id
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  def avatar_image
    if avatar.attached?
      avatar
    else
      'default-avatar.png'
    end
  end
end
