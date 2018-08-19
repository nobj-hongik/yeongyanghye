class FreeCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_owner?, only: [:destroy]
    
    def create
        @free = Free.find(params[:free_id])
        @new_comment = FreeComment.new(comment: params[:comment],
                                  free_id: params[:free_id],
                                  user_id: current_user.id)
        if @new_comment.save
          redirect_to :back
        end    
    end

    def destroy
        if @freecomment.destroy
            redirect_to free_path(params[:free_id])
        end
    end
    
    def update
        @free = Free.find(params[:free_id])
        @find_comment = FreeComment.find(comment: params[:comment],
                                  free_id: params[:free_id],
                                  user_id: current_user.id)
        if @find_comment.save
            redirect_to :back
        end
    end
  
  
    private 
  
    def is_owner?
        # debugger
        @freecomment = FreeComment.find_by(id: params[:id])
        redirect_to root_path if @freecomment.user.id != current_user.id
    end    
    
end
