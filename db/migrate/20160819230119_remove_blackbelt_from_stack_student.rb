class RemoveBlackbeltFromStackStudent < ActiveRecord::Migration
  def change
    remove_column :stack_students, :blackbelt, :boolean
  end
end
