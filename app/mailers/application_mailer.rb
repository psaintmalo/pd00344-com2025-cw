class ApplicationMailer < ActionMailer::Base
  default to: "support@forum.com", from: 'support@forum.com'
  layout 'mailer'
end
