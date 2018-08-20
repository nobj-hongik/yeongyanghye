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
        if @magazincomment.destroy
          redirect_to magazine_path(params[:magazine_id])
        end        
    end
    
    
    private 
    
    def is_owner?
        @magazincomment = MagazineComment.find_by(id: params[:id])
        redirect_to root_path if @magazincomment.user.id != current_user.id
    end    
end
