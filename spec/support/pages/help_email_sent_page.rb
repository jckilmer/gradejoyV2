class HelpEmailSentPage < Page
  def has_email_sent_message?
    has_css?('.qa-email-sent-message')
  end
end
