class ApplicationMailer < ActionMailer::Base
  default to: "support@moduleselector.com", from: 'support@moduleselector.com'
  layout 'mailer'
end
