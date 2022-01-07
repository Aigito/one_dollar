class GoalsController < ApplicationController
  before_action :find_goal, only: %i[show edit update destroy]

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
      render :new
    end
  end

  private

  def find_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :amount, :date, :user_id)
  end
end
