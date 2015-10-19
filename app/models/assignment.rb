class Assignment < ActiveRecord::Base
  belongs_to :user
  has_many :course_assignments
  has_many :courses, through: :course_assignments
  has_many :grades
  has_many :students, through: :grades
  belongs_to :category

  validates :name, presence: true
  validates :user, presence: true
end
