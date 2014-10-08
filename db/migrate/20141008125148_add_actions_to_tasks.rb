class AddActionsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :action, :string
    add_column :tasks, :action_url, :string
  end
end
