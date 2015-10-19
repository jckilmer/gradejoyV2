class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable

  has_many :assignments, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :course_assignments, dependent: :destroy
  has_many :course_enrollments, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :help_requests, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :grades, dependent: :destroy
  has_many :categories, dependent: :destroy
end
