class AssignmentPage < Page
  def visit_page(assignment)
    visit("/assignments/#{assignment.id}/edit")
  end

  def fill_form(attributes)
    find('.qa-assignment-name').set(attributes[:name])
    find('.qa-assignment-category').set(attributes[:period])
    find('.qa-assignment-total-points').set(attributes[:section])
  end

  def submit
    find('.qa-submit-assignment')
  end
end
