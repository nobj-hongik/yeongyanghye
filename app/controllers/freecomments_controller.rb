class FreecommentsController < ApplicationController
    
    def create
    @free = Free.find(params[:free_id])
    @comment = @free.comments.new
    @comment.comment = params[:comment]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to @post
    end
end
