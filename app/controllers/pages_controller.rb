class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @goals = Goal.all
    @invested = @user.invested
    @investment = @user.investment
    @percentage_completion = @invested.to_f / @investment * 100
  end

  def taxcalc
  end
end
