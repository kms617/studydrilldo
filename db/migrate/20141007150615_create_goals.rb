class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal, null: false
      t.integer :duration, null:false
      t.boolean :completed, null:false
      t.text :objective

      t.timestamps
    end
  end
end
