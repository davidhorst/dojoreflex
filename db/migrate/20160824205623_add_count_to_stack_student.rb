class AddCountToStackStudent < ActiveRecord::Migration
  def change
    add_column :stack_students, :assignment_count, :integer
  end
end
