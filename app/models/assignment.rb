class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :name, presence: true
  validates :user, presence: true
end
