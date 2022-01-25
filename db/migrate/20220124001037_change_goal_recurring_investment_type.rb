class ChangeGoalRecurringInvestmentType < ActiveRecord::Migration[6.1]
  def change
    change_column(:goals, :recurring_investment, :integer)
  end
end
