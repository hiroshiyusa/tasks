class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :deadline
      t.string :staff

      t.timestamps null: false
    end
  end
end
