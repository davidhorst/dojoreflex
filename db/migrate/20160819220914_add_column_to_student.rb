class AddColumnToStudent < ActiveRecord::Migration
  def change
    add_column :students, :belts_counter, :integer
  end
end
