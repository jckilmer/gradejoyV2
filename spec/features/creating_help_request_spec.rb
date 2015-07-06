require 'rails_helper'

RSpec.feature 'Creating help request', type: :feature do
  context 'with the help form filled out correctly' do
    let!(:user) { create(:user) }
    let!(:help_request) { create(:help_request, email: user.email) }

    it 'successfully creates a help request' do
      help_request_page.visit_page.fill_help_form(user.email, help_request.message)
      help_request_page.submit_help_form
      expect(help_email_sent_page).to have_email_sent_message
      expect(last_email.from).to include(user.email)
    end
  end
end
