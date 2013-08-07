class HomeController < ApplicationController
  def index
    redirect_to users_path and return if current_user && current_user.has_role?(:admin)
    redirect_to apps_path if current_user
  end
end
