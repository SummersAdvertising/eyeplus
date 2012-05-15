class Admin::AnswersController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    @answer.user_id = current_user.id
    @answer.save
    redirect_to admin_question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to admin_question_path(@question)
  end
end
