class HomeController < ApplicationController
  def index
    redirect_to users_path and return if current_user && current_user.has_role?(:admin)
    render 'user_index' if current_user
  end
end
