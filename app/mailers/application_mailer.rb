class ApplicationMailer < ActionMailer::Base
  default from: %{"TestNeGuru" <mail@testneguru.com>}
  layout 'mailer'
end
