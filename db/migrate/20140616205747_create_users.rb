class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :is_mentor
      t.boolean :is_student
      t.string :auth_key

      t.timestamps
    end

    add_index :users,:email, unique: true
    add_index :users, :auth_key, unique: true
  end
end
