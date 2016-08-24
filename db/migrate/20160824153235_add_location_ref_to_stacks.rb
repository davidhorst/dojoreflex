class AddLocationRefToStacks < ActiveRecord::Migration
  def change
    add_reference :stacks, :location, index: true, foreign_key: true
  end
end
