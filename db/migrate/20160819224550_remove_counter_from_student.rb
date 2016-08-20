class RemoveCounterFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :belts_counter, :integer
  end
end
