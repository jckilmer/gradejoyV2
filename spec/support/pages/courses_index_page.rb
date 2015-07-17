class CourseIndexPage < Page
  def visit_page
    visit('/courses')
    self
  end

  def has_course?(course)
    has_css?(".qa-course-#{course.id}")
  end

  def click_create_new_course_button
    find('.qa-create-course').click
  end

  def fill_form(attributes)
    find('.qa-course-name').set(attributes[:name])
    find('.qa-course-period').set(attributes[:period])
    find('.qa-course-section').set(attributes[:section])
  end

  def submit
    find('.qa-submit-course').click
  end
end
