class Course < ActiveRecord::Base
  has_many :assignments
  belongs_to :user
  validates :name, presence: true
  validates :user, presence: true
end
