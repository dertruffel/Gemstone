class AdminPanelController < ApplicationController
  before_action :checkadmin
  def index

  end

  def checkadmin
    unless current_user.isadmin?
      redirect_to root_path
    end
  end
end
