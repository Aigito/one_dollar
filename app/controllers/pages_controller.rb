class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @goals = Goal.all
    @total_invested = 0

    @goals.each do |goal|
      @total_invested += Integer(goal.recurring_investment) if goal.user == current_user && goal.archived != true
    end

    @investment = @user.investment
    @percentage_completion = @invested.to_f / @investment * 100
  end

  def taxcalc
  end
end
