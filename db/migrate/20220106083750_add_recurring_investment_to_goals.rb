class AddRecurringInvestmentToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :recurring_investment, :float
  end
end
