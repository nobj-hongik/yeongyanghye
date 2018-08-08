class AnswerLikesController < ApplicationController
  before_action :authenticate_user!

  def like_toggle
    like = AnswerLike.find_by(user_id: current_user.id,
                        answer_id: params[:answer_id])

    if like.nil?
      AnswerLike.create(user_id: current_user.id,
                  answer_id: params[:answer_id])
    else
      like.destroy
    end

    redirect_to :back
  end
end
