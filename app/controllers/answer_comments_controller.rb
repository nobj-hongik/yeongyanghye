class AnswerCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]

  def create
    @answer = Answer.find(params[:answer_id])
    @new_comment = AnswerComment.new(content: params[:content],
                              answer_id: params[:answer_id],
                              user_id: current_user.id)
    if @new_comment.save
      redirect_to question_path(@answer.question.id)
    end
  end

  def destroy
    if @comment.destroy
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def check_ownership!
    @comment = AnswerComment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end
end
