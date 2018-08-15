class FreesController < InheritedResources::Base

  before_action :authenticate_user!, only: [:new, :edit]
  
  
  private

    def free_params
      params.require(:free).permit(:title, :content, :user_id)
    end
end
