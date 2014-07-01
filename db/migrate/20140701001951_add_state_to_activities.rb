class AddStateToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :state, :integer, :default => 0, :null => false
  end
end
