class AddUserIdColumnToTasksGoals < ActiveRecord::Migration
  def change
    add_column :goals, :user_id, :integer, null: false
    add_column :tasks, :user_id, :integer, null: false
  end
end
