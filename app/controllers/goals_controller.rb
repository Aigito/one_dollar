class GoalsController < ApplicationController
  before_action :find_goal, only: %i[show edit update destroy]

  def index
    @goals = Goal.all
  end

  def update_goal_extra_saved
    @goal = Goal.find(params[:id])
    if @goal.update(goal_extra_saved_params)
      redirect_to goal_path(find_goal)
    else
      render :show
    end
  end

  def show
    find_goal
    @days_left = (@goal.date - Date.today).to_i
    if @days_left >= 365
      @years = @days_left / 365
      @days = @days_left - (365 * @years)
      @time_left = "#{@years}y and #{@days}d"
    else
      @time_left = "#{@days_left} day/s"
    end
    @weeks_past = ((Date.today - @goal.created_at.to_date) / 7).to_i
    @total_saved = find_goal.extra_saved + @weeks_past * @goal.recurring_investment
    @outstanding_amount = @goal.amount - @total_saved
    @amount_in_year = @goal.recurring_investment * 52
    @hash = {}
    @hash2 = {}
    i = 0
    j = 0
    loop do
      @hash[Date.today + (i * 7)] = @goal.recurring_investment * i
      i += 1
      break if @goal.recurring_investment * (i - 1) >= @goal.amount
    end

    loop do
      @hash2[Date.today + (j * 7)] = @goal.recurring_investment * j + @goal.extra_saved
      j += 1
      break if (@goal.recurring_investment * (j - 1) + @goal.extra_saved) >= @goal.amount
    end

    red = "#FF0000"
    blue = "#0000FF"
    green = "#109618"
    pink = "#FFC0CB"

    @weeks_left_by_user = (@days_left / 7).floor
    @weeks_left_by_goal = @outstanding_amount / @goal.recurring_investment
    @warning_message = "Warning! Expected completion date is after user set due date!"

    if @weeks_left_by_user < @weeks_left_by_goal
      @first_line = red
      @second_line = green
    else
      @first_line = blue
      @second_line = green
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.archived = false
    if @goal.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def archive
    @goal = Goal.find(params[:id])
    @goal.update(archived: true)
    redirect_to dashboard_path
  end

  def unarchive
    @goal = Goal.find(params[:id])
    @goal.update(archived: false)
    @goals = Goal.all
    redirect_to goals_path
  end

  def archived_goals_tab

  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(find_goal)
    else
      render :edit
    end
  end

  private

  def find_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :amount, :recurring_investment, :date, :user_id, :photo)
  end

  def goal_extra_saved_params
    params.require(:goal).permit(:extra_saved)
  end

end
