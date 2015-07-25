require 'rails_helper'

RSpec.feature 'Creating a course', type: :feature, js: true do
  context 'with valid attributes' do
    let!(:course) { attributes_for(:course) }
    let!(:user) { create(:user) }

    it 'creates a course' do
      log_in(user)
      course_index_page.click_create_new_course_button
      course_index_page.fill_form(course)
      course_index_page.submit
    end
  end
end
