class LogInPage < Page
  def visit_page
    visit "/users/sign_in"
    self
  end

  def log_in(user)
    find('#qa-email').set(user.email)
    find('#qa-password').set(user.password)
    find('#qa-login-submit').click
    find('#qa-gradebook')
    self
  end
end
