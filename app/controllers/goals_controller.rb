class GoalsController < ApplicationController
  before_action :find_goal, only: %i[show edit update destroy]

  def index
    @goals = Goal.all
  end

  def show
    find_goal
    @days_left = @goal.date - Date.today
    @weeks_past = (Date.today - @goal.created_at.to_date) / 7
    @total_saved = @weeks_past * @goal.recurring_investment
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def archive
    @goal = Goal.find(params[:id])
    @goal.update(archived: true)
    redirect_to goals_path
  end

  def unarchive
    @goal = Goal.find(params[:id])
    @goal.update(archived: false)
    redirect_to goals_path
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  private

  def find_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :amount, :recurring_investment, :date, :user_id)
  end
end
