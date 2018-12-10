# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@photofeedapp.com'
  layout 'mailer'
end
