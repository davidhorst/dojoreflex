class AddColToStack < ActiveRecord::Migration
  def change
    add_column :stacks, :total_assignments, :integer
  end
end
