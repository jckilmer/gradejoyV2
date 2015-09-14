require 'rails_helper'

RSpec.feature 'Creating a course', type: :feature, js: true do
  context 'with valid attributes' do
    let!(:user) { create(:user) }
    let!(:course) { create(:course, user: user) }

    it 'creates a course' do
      log_in(user)
      course_index_page.create_new_course(course)
      expect(course_index_page).to have_course(course)
    end
  end
end
