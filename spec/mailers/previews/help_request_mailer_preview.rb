# Preview all emails at http://localhost:3000/rails/mailers/help_request_mailer
class HelpRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/help_request_mailer/new_request
  def new_request
    HelpRequestMailer.new_request(HelpRequest.last)
  end

end
