class SubmissionsController < ApplicationController 

  def index
    @oral_presentations = Submission.orals
    @poster_presentations = Submission.posters
  end

  def new
    @submission = Submission.new
  end
  
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      flash.keep[:success] = "Thank you for submission."
      SubmissionMailer.confirmation_email(@submission).deliver_later
      redirect_to root_url 
    else
      flash.now[:error] = @submission.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:name, :email, :title, :abstract, :presentation_type, :dietary_restrictions, :attender_type, :sub_department, :will_attend_social_event)
  end

end

