class AddBlackbeltcountToStudent < ActiveRecord::Migration
  def change
    add_column :students, :blackbelt_count, :integer
  end
end
