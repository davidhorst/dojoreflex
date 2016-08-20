class DropBeltTable < ActiveRecord::Migration
  def change
    drop_table :belts
  end
end
