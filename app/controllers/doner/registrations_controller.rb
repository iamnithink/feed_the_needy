# frozen_string_literal: true

class Doner::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    dashboards_path
  end

end
