class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :load_user, only: [:new, :edit, :create, :update]
  before_action :load_object, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    if params[:category]
      @questions = Question.where(category: params[:category]).order('created_at DESC')
    else
      @questions = Question.all.order('created_at DESC')
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      redirect_to questions_path
    end
  end

  def edit
  end

  def show
    @answers = Answer.where(question_id: params[:id]).all.order('created_at DESC')
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render 'edit'
    end
  end

  def destroy
     @question.destroy
     redirect_to questions_path
  end

  private

  def load_user
    @user = User.find(current_user.id)
  end

  def load_object
    @question = Question.find_by(id: params[:id])
  end

  def check_ownership
    redirect_to questions_path if @question.user.id != current_user.id
  end

  def question_params
    params.require(:question).permit(:user_id,:category,:title,:content,:image)
  end

end
