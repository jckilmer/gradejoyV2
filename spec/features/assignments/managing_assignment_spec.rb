require 'rails_helper'

RSpec.feature 'Managing assignments', type: :feature, js: true do
  describe 'Creating an assignment' do
    let(:user) { create(:user) }
    let(:course) { create(:course, user: user) }
    let(:assignment_attrs) { attributes_for(:assignment) }
    context 'with valid attributes' do
      it 'creates an assignment' do
        log_in(user)
        course_page.visit_page(course)
        course_page.create_new_assignment(assignment_attrs)
        created_assignment = course.reload.assignments.last
        expect(course_page).to have_assignment(created_assignment)
      end
    end
  end

  describe 'Editing an assignment' do
    let(:user) { create(:user) }
    let(:course) { create(:course, user: user) }
    let(:assignment_attrs) { attributes_for(:assignment) }
    let!(:assignment) { create(:assignment, course: course, user: user) }
    it 'updates the assignment attributes' do
      log_in(user)
      course_page.visit_page(course)
      course_page.navigate_to_edit_assignment_page(assignment)
      assignment_page.fill_form(assignment_attrs)
      assignment_page.submit
      updated_assignment = Assignment.last
      assignment_verifier = AssignmentVerifier.new(updated_assignment)
      expect(assignment_verifier).to have_assignment_attributes(assignment_attrs)
    end
  end

  describe 'Deleting an assignment' do
    let(:user) { create(:user) }
    let(:course) { create(:course, user: user) }
    let!(:assignment) { create(:assignment, course: course, user: user) }
    it 'deletes the assignment' do
      log_in(user)
      course_page.visit_page(course)
      course_page.delete_assignment(assignment)
      expect(course_page).to have_no_assignment(assignment)
    end
  end
end
