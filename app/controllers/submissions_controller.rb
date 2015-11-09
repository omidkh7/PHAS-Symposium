class SubmissionsController < ApplicationController 

  def index
    if Rails.env == 'production'
      ORAL_PRESENTATION_ORDERED_IDS = [5, 11, 12, 16, 27, 8, 22, 20, 4, 28, 26, 13, 2, 18, 15, 23, 1, 14, 32, 29, 30, 31]
      @oral_presentations = Submission.find(ORAL_PRESENTATION_ORDERED_IDS, order: "field(id, #{ORAL_PRESENTATION_ORDERED_IDS.join(',')})")
    else
      @oral_presentations = Submission.orals
    end
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
    params.require(:submission).permit(:name, :email, :title, :abstract, :presentation_type, :dietary_restrictions, :attender_type, :sub_department, :will_attend_social_event, :co_authors)
  end

end

