class AddStateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :state, :string, :default => "active", :null => false
    add_column :contracts, :days_left, :integer, :default => 30, :null => false
    add_column :contracts, :duration, :integer, :default => 30, :null => false
    add_column :activities, :days_active, :integer, :default => 1, :null => false
    add_column :activities, :complete_today, :boolean, :default => false, :null => false
  end
end
