# app/controllers/superadmin/registrations_controller.rb

class Superadmin::RegistrationsController < Devise::RegistrationsController
  before_action :authorize_superadmin, only: [:new]

  private

  def authorize_superadmin
    redirect_to root_path unless user_signed_in? && current_user.superadmin?
  end

end
