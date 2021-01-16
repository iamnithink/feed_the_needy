

class DashboardsController < ApplicationController
  before_action :authenticate_user!  

  def index
    if current_user.super_admin?
      @foods = Food.all
    else
      @foods = Food.where(user_id: current_user.id)
    end
  end
end
  