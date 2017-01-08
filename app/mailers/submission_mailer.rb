class SubmissionMailer < ApplicationMailer
  default from: 'donotreply@phasdga.ca'

  def confirmation_email(submission)
    @submission = submission

    mail(
      to: @submission.email,
      subject: 'PHAS Symposium 2017 Registration Confirmation',
      bcc: ['akhali@ucalgary.ca'],
    )
  end
end
