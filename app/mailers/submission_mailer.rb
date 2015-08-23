class SubmissionMailer < ApplicationMailer
  default from: 'donotreply@iqst.ca'

  def confirmation_email(submission)
    @submission = submission

    mail(to: @submission.email, subject: 'PHAS Symposium 2015 Registration Confirmation')
  end
end
