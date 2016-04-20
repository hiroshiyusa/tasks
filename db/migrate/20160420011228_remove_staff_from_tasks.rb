class RemoveStaffFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :staff, :string
  end
end
