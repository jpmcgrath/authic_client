class AuthicCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :email, :null => false, :default => "" 
      t.string :provider 
      t.string :uid  
      t.string :authic_data  
      

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