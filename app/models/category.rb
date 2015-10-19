class Category < ActiveRecord::Base
  validates :category, presence: true
  validates :weight, presence: true
  has_many :assignments
  belongs_to :user
end
