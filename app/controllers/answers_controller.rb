class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :load_object, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def new
    @answer = @question.answers.build
  end

  def create
    @question.answers.create(answer_params)
    redirect_to question_path(@question.id)
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question.id)
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question.id)
  end

  def select_answer
    @target = Answer.find(params[:answer_id])
    @target.toggle_answer
    redirect_to question_path(@target.question)
  end

  private

  def load_object
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
  end

  def check_ownership
    redirect_to questions_path if @answer.user.id != current_user.id
  end

  def answer_params
    params.require(:answer).permit(:user_id,:title,:content,:image)
  end

end
