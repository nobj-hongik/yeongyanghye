class QuestionLikesController < ApplicationController
  before_action :authenticate_user!

  def like_toggle
    like = QuestionLike.find_by(user_id: current_user.id,
                        question_id: params[:question_id])

    if like.nil?
      QuestionLike.create(user_id: current_user.id,
                  question_id: params[:question_id])
    else
      like.destroy
    end

    redirect_to :back
  end
  
end
