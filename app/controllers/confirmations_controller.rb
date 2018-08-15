class ConfirmationsController < Devise::ConfirmationsController
  private
  def registration_path_for(resource_name, resource)
    "/users/sign_up"
  end
end