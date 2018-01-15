class SubmissionsController < ApplicationController 

  ORAL_PRESENTATION_ORDERED_IDS = [].freeze
  POSTER_PRESENTATION_ORDERED_IDS = [].freeze

  def index
    begin
      @oral_presentations = ORAL_PRESENTATION_ORDERED_IDS.collect { |id| Submission.find(id) }
      @poster_presentations = POSTER_PRESENTATION_ORDERED_IDS.collect { |id| Submission.find(id) }
    rescue
      @oral_presentations = Submission.orals
      @poster_presentations = Submission.posters
    end

    render 'noschedule'
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

