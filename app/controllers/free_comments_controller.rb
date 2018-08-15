class FreeCommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @free = Free.find(params[:free_id])
        @new_comment =FreeComment.new(comment: params[:comment],
                                  free_id: params[:free_id],
                                  user_id: current_user.id)
        if @new_comment.save
          redirect_to :back
        end    
    end
    
end
