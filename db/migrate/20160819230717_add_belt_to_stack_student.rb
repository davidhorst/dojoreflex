class AddBeltToStackStudent < ActiveRecord::Migration
  def change
    add_column :stack_students, :belt, :string
  end
end
