class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @goals = Goal.all
    @total_invested = 0

    @goals.each do |goal|
      @total_invested += goal.amount if goal.user == current_user && goal.archived != true
    end

    @investment = @user.investment
    @percentage_completion = @invested.to_f / @investment * 100

    @goal_suggestions = [
      "Give to charity",
      "Build up emergency fund",
      "Backpacking trip",
      "New pair of running shoes",
      "Hire a clown",
      "Nice bottle of wine",
      "Gift to a friend",
      "Retirement!!!",
      "Down payment for a horse",
      "Le Wagon Coding Bootcamp",
      "Index Fund / EFTs",
      "Gym Equipment"
    ]
  end

  def taxcalc
  end
end
