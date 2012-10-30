class AuthicCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, :null => false, :default => ""
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
      t.string :provider
      t.string :uid
      t.string :authic_data   


      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :provider
    add_index :users, :uid
  end
end