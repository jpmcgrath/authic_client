class AuthicCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, :null => false, :default => "" 
      t.string :provider 
      t.string :uid  
      t.string :authic_data  
      
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :mobile
      t.string :phone
      t.date :birth_date
      t.string :groups
      t.string :roles
      


      t.timestamps
    end

    
    add_index :users, :email, :unique => true 
    add_index :users, :provider 
    add_index :users, :uid

  end
end