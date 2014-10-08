class CreateMethodologies < ActiveRecord::Migration
  def change
    create_table :methodologies do |t|
      t.string :name, null: false
    end
  end
end
