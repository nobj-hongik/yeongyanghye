class QuestionCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]

  def create
    @question = Question.find(params[:question_id])
    @new_comment = QuestionComment.new(content: params[:content],
                              question_id: params[:question_id],
                              user_id: current_user.id)
    if @new_comment.save
      redirect_to question_path(@question.id)
    end
  end

  def destroy
    if @comment.destroy
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def check_ownership!
    @comment = QuestionComment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end
end
