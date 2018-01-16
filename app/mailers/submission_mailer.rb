class SubmissionMailer < ApplicationMailer
  default from: 'donotreply@phasdga.ca'

  def confirmation_email(submission)
    @submission = submission

    mail(
      to: @submission.email,
      subject: 'PHAS Symposium 2018 Registration Confirmation',
      bcc: ['phasdga@gmail.com'],
    )
  end
end
