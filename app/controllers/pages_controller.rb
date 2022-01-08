class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @goals = Goal.all
    @percentage_completion = 750.0 / 1000.0 * 100
  end
end
