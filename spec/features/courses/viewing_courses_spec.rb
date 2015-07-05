require 'rails_helper'

RSpec.feature 'Viewing courses', type: :feature, js: true do

  describe 'viewing the list of courses' do
    let!(:course) { create(:course, user: user) }
    let!(:user) { create(:user) }
    it 'shows a list of courses' do
      log_in(user)
      course_index_page.visit_page
      expect(course_index_page).to have_course(course)
    end
  end
end
