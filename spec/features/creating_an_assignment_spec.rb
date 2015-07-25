require 'rails_helper'

RSpec.feature 'Creating an assignment', type: :feature, js: true do
  context 'with valid attributes' do
    let!(:user) { create(:user) }
    let!(:course) { create(:course, user: user) }
    let!(:assignment) { attributes_for(:assignment)}

    it 'creates an assignment' do
      log_in(user)
      course_page.visit_page(course)
      course_page.create_new_assignment(assignment)
    end
  end
end
