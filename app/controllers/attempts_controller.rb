class AttemptsController < ApplicationController

  helper 'surveys'

  before_filter :load_survey, only: [:new, :create]

  def index
    @surveys = Survey::Survey.active
  end

  def show
    @attempt = Survey::Attempt.find_by(id: params[:id])
  end

  def new
    @participant = current_user # you have to decide what to do here

    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def create
    @attempt = @survey.attempts.new(params_whitelist)
    @attempt.participant = current_user
    if @attempt.valid? && @attempt.save
      correct_options_text = @survey.correct_options.present? ? 'Bellow are the correct answers marked in bold' : ''
      redirect_to attempt_path(@attempt.id), notice: "Congratulation for answering #{@survey.name}. #{correct_options_text}"
    else
      build_flash(@attempt)   
      @participant = current_user
      render :new
    end
  end

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

  def current_user
    session[:user_id] ||= User.create.id
    User.find(session[:user_id])
  end
end