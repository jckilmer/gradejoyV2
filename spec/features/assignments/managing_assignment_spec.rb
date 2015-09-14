require 'rails_helper'

RSpec.feature 'Managing assignments', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:course) { create(:course, user: user) }

  before do
    log_in(user)
  end

  describe 'Creating an assignment' do
    let!(:assignment) { attributes_for(:assignment) }
    context 'with valid attributes' do
      it 'creates an assignment' do
        course_page.visit_page(course)
        course_page.create_new_assignment(assignment)
        created_assignment = course.reload.assignments.last
        expect(course_page).to have_assignment(created_assignment)
      end
    end
  end

  describe 'Editing an assignment' do
  end

  describe 'Deleting an assignment' do
  end
end
