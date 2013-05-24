class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:create]

  # This will give the control back the the admins controller.
  def sign_up(resource_name, resource)
    #sign_in(resource_name, resource)
  end
  # This will give the control back the the admins controller.
  def after_sign_up_path_for(resource)
    #after_sign_in_path_for(resource)
  end
end
