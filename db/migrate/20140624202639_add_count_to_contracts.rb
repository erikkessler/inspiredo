class AddCountToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :count, :integer, :null => false, :default => 0
    add_column :contracts, :needed, :integer
    add_index :activities, :contract_id
    add_index :contracts, :user_id
    add_column :activities, :value, :integer
  end
end
