class SubmissionMailer < ApplicationMailer
  default from: 'donotreply@phasdga.ca'

  def confirmation_email(submission)
    @submission = submission

    mail(
      to: @submission.email,
      subject: 'PHAS Symposium 2015 Registration Confirmation',
      bcc: ['jonny.p.johannes@ucalgary.ca'],
    )
  end
end
