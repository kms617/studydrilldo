class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :goal_id, null: false
      t.string :focus, null: false
      t.string :methodology_id, null: false
      t.boolean :completed, null: false
      t.integer :duration, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
