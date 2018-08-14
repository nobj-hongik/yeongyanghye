class FreelikesController < ApplicationController
    before_action :authenticate_user!

def like_toggle
    like = Freelike.find_by(user_id: current_user.id, free_id: params[:free_id])
    
    if like.nil?
      Freelike.create(user_id: current_user.id, free_id: params[:free_id])
    else
      like.destroy
    end
    
    redirect_to :back
end

end
