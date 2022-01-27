class AddExtraSavedToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :extra_saved, :integer, default: 0
  end
end
