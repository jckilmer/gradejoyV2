require 'rails_helper'

RSpec.feature 'Course page buttons', type: :feature, js: true do
  let!(:user) { create(:user) }

  before do
    log_in(user)
    course_page.visit_page(course)
  end

  describe 'course page buttons' do
    let!(:course) { create(:course, user: user) }

    context 'pressing the edit course button' do
      it 'shows the edit form' do
        course_page.press_edit_course_button
        course_page.fill_form(course)
        course_page.submit
      end
    end

    context 'the delete course button' do
      it 'has the correct attribute' do
        delete_course_button = find('.qa-delete-course')
        expect(delete_course_button['data-confirm']).to eq 'Are you sure you want to delete this course?'
      end
    end

    context 'pressing the back to courses list button' do
      it 'takes the user back to courses_path' do
        course_page.press_back_to_courses_list_button
        find('.qa-courses-header')
        expect(current_path).to eq('/courses')
      end
    end
  end
end
