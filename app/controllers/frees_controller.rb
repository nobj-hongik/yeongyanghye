class FreesController < InheritedResources::Base
  before_action :authenticate_user!, only: [:show, :new, :edit]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  
  
private

    def free_params
      params.require(:free).permit(:title, :content, :user_id)
    end
    
    def is_owner?
        @free = Free.find_by(id: params[:id])
        redirect_to frees_path if @free.user_id != current_user.id
    end
    
end
