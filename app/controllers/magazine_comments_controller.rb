class MagazineCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_owner?, only: [:destroy]
    
    def create
        @magazin = Magazine.find(params[:magazine_id])
        @new_comment =MagazineComment.new(content: params[:content],
                                  magazine_id: params[:magazine_id],
                                  user_id: current_user.id)
        if @new_comment.save
          redirect_to :back
        end    
    end
    
    def destroy
        @magazin_comment.destroy
        redirect_to magazine_path(params[:magazine_id]) # :back 과 같음
    end
    
    
    private 
    
    def is_owner?
        redirect_to @magazin unless current_user == @magazin_comment.user
    end    
end
