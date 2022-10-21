class ApplicationMailer < ActionMailer::Base
  default from: "new_post@thenewsletterapp.com"
  layout "mailer"
end
