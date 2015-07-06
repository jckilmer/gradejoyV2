class HelpRequest < ActiveRecord::Base
  belongs_to :user
  validates :email, presence: true
  validates :message, presence: true
end
