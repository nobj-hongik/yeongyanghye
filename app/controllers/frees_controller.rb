class FreesController < InheritedResources::Base

  private

    def free_params
      params.require(:free).permit(:title, :content, :user_id)
    end
end

