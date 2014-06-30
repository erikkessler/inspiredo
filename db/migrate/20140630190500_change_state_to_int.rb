class ChangeStateToInt < ActiveRecord::Migration
  def change
    remove_column :contracts, :state
    add_column :contracts, :state, :integer, :default => 0, :null => false
  end
end
