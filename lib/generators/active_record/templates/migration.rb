class AuthicCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :email, :null => false, :default => "" # the email address of the user
      t.string :provider # always 'authic' - to be deprecated soon
      t.string :uid, :null => false # A unique identifier for the user assigned by Authic
      t.text :authic_data # a JSON encoded varibles related to the user, e.g the user's facebook id
      
      t.string :first_name # The first name of the user
      t.string :last_name # The last name of the user
      t.string :full_name # the combined first and last name of the user
      t.string :mobile # the mobile (cell) phone number of the user
      t.string :phone # the landline phone number of the user
      t.date :birth_date # the birth date of the user
      t.text :groups # which groups the user belongs to (future road map)
      t.text :roles # which roles the user belongs to (future road map)
      
      t.string :middle_name # the middle name of the user
      t.string :gender # the gender of the user
      t.string :timezone # the timezone in which the user is located
      t.string :country # the country in which the user is located
      t.text :address # the address in which the user is located

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