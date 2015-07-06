module MailSupport
  def all_emails
    ActionMailer::Base.deliveries
  end

  def last_email
    all_emails.last
  end
end

RSpec.configure do |config|
  config.include MailSupport, type: :feature
end
