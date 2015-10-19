def presence_of_a_name
  validate :presence_of_a_name
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments
  belongs_to :user

  has_many :grades
  has_many :assignments, through: :grades

  def presence_of_a_name
    unless first_name.present? || last_name.present?
      errors.add(:first_name, 'Must have a first or last name.')
      errors.add(:last_name, 'Must have a first or last name.')
    end
  end
end
