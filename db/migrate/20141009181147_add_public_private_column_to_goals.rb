class AddPublicPrivateColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :secret, :boolean, null: false, default: false
    add_column :tasks, :secret, :boolean, null: false, default: false
  end
end
