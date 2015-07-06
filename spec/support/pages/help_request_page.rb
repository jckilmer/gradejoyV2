class HelpRequestPage < Page
  def visit_page
    visit('/help')
    self
  end

  def submit_help_form
    find('.qa-submit').click
  end

  def fill_help_form(email, message)
    find('.qa-email').set(email)
    find('.qa-message').set(message)
  end
end
