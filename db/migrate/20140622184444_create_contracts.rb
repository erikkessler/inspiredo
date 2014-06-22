class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :user_id
      t.string :name
      t.string :reward

      t.timestamps
    end
  end
end
