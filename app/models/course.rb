class Course < ActiveRecord::Base
  has_many :course_enrollments
  has_many :students, through: :course_enrollments

  has_many :course_assignments
  has_many :assignments, through: :course_assignments
  belongs_to :user
  validates :name, presence: true
  validates :user, presence: true
end
