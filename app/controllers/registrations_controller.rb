# class RegistrationsController < ApplicationController

# class RegistrationsController < Devise::RegistrationsController
#   before_action :configure_permitted_parameters

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
#   end
# end

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:superadmin])
  end
end
