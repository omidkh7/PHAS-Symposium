class SubmissionsController < ApplicationController 

  ORAL_PRESENTATION_ORDERED_IDS = [101, 81, 80, 76, 93, 95, 106, 87, 65, 99, 91, 89, 102, 92, 105, 94].freeze

  def index
    if Settings.show_schedule
      if Rails.env == 'production'
        @oral_presentations = ORAL_PRESENTATION_ORDERED_IDS.collect { |id| Submission.find(id) }
      else
        @oral_presentations = Submission.orals
      end
      @poster_presentations = Submission.posters
    else
      render 'index'
    end
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

