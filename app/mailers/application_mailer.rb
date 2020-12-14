class ApplicationMailer < ActionMailer::Base
  # Setting up default email to and from
  default to: "support@forum.com", from: 'support@forum.com'
  layout 'mailer'
end
