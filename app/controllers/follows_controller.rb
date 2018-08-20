class FollowsController < ApplicationController

    def nutri_follow_toggle
        @nutrition = Nutrition.find params[:id]
    
        if !@nutrition.followed_by?(current_user)
            current_user.follow(@nutrition)
        else
            current_user.stop_following(@nutrition)
        end
        redirect_to @nutrition        
    end
    
end
