class AddActiveToInstructor < ActiveRecord::Migration
  def change
    add_column :instructors, :active, :boolean
  end
end
