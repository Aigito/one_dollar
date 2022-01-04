class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    find_goal
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

  private

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :amount, :date, :user_id)
  end
end
