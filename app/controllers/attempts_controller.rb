class AttemptsController < ApplicationController

  helper 'surveys'

  before_filter :load_survey, only: [:new, :create, :show, :mercury_update]

  def index
    @surveys = Survey::Survey.active
  end

  def show
    @attempt = Survey::Attempt.find_by(id: params[:id])
    render :access_error if current_user.id != @attempt.participant_id
  end

  def new
    @participant = current_user

    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def updare
  end 

  def create
    @attempt = @survey.attempts.new(params_whitelist)
    @attempt.participant = current_user
    if @attempt.valid? && @attempt.save
        correct_options_text = @survey.correct_options.present? ? 'Bellow are the correct answers marked in green' : ''
      redirect_to attempt_path(@attempt.id, survey_id: @survey.id), notice: "Thank you for answering #{@survey.name}! #{correct_options_text}"
    else
      build_flash(@attempt)
      @participant = current_user
      render :new
    end
  end

#  def mercury_update
#      @attempt = Attempt.find(params[:id])
#      # Update page
#      render text: '{}'
#  end



  def delete_user_attempts
    Survey::Attempt.where(participant_id: params[:user_id], survey_id: params[:survey_id]).destroy_all
    redirect_to new_attempt_path(survey_id: params[:survey_id])
  end

  private

  def load_survey
    @survey = Survey::Survey.find_by(id: params[:survey_id])
  end

  def params_whitelist
    if params[:survey_attempt]
      params[:survey_attempt][:answers_attributes] = params[:survey_attempt][:answers_attributes].map { |attrs| { question_id: attrs.first, option_id: attrs.last } }
      params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes)
    end
  end

end
