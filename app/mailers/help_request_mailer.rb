class HelpRequestMailer < ApplicationMailer
  def new_request(help_request)
    @help_request = help_request
    mail to: "gradejoyhelp@gmail.com", subject: "New Help Request"
  end
end
