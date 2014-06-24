class AddCountToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :count, :integer, :null => false, :default => 0
  end
end
