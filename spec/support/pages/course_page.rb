class CoursePage < Page
  def visit_page(course)
    visit("/courses/#{course.id}")
    self
  end

  def press_edit_course_button
    find('.qa-edit-course').click
  end

  def fill_form(attributes)
    find('.qa-course-name').set(attributes[:name])
    find('.qa-course-period').set(attributes[:period])
    find('.qa-course-section').set(attributes[:section])
  end

  def submit
    find('.qa-submit-course').click
  end

  def press_back_to_courses_list_button
    find('.qa-back-to-courses-list').click
  end

  def create_new_assignment(attributes)
    find('.qa-create-assignment').click
    find('.qa-assignment-name').set(attributes[:name])
    find('.qa-assignment-category').set(attributes[:category])
    find('.qa-assignment-total-points').set(attributes[:total_points])
    find('.qa-submit-assignment').click
  end
end
