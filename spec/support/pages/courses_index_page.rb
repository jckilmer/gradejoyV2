class CourseIndexPage < Page
  def visit_page
    visit('/courses')
    self
  end

  def has_course?(course)
    has_css?(".qa-course-#{course.id}")
  end

  def create_new_course(attributes)
    find('.qa-create-course').click
    find('.qa-course-name').set(attributes[:name])
    find('.qa-course-period').set(attributes[:period])
    find('.qa-course-section').set(attributes[:section])
    find('.qa-submit-course').click
  end

  def click_course(course)
    find(".qa-course-#{course.id}").click
  end
end
