class AssignmentVerifier < Verifier
  def has_assignment_attributes?(assignment_attributes)
    assert_attributes(assignment_attributes, :name, :category, :total_points)
  end
end
