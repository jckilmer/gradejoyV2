class CourseIndexPage < Page
  def visit_page
    visit("/courses")
    self
  end

  def has_course?(course)
    has_css?("qa-course-#{course.id}")
  end
end
