class MagazinelikesController < ApplicationController
  before_action :authenticate_user!

  def like_toggle
    magazinelike = Magazinelike.find_by(user_id: current_user.id, magazine_id: params[:magazine_id])

    if magazinelike.nil?
      Magazinelike.create(user_id: current_user.id,
                  magazine_id: params[:magazine_id])
    else
      magazinelike.destroy
    end

    redirect_to magazine_url(params[:magazine_id])
  end    
  
end
