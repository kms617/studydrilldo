class RenameGoalColumnInGoalsToName < ActiveRecord::Migration
  def change
    rename_column :goals, :goal, :name
  end
end
