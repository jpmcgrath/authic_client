class AuthicCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :email, :null => false, :default => "" 
      t.string :provider 
      t.string :uid  
      t.text :authic_data  
      
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :mobile
      t.string :phone
      t.date :birth_date
      t.string :groups
      t.string :roles
      
      t.string :middle_name
      t.string :gender
      t.string :timezone
      t.string :country
      t.string :address

<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>

      t.timestamps
    end

    
    add_index :<%= table_name %>, :email, :unique => true 
    add_index :<%= table_name %>, :provider 
    add_index :<%= table_name %>, :uid

  end
end