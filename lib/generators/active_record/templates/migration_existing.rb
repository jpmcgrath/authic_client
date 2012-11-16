class AddAuthicTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table(:<%= table_name %>) do |t|
      t.string :email, :null => false, :default => "" unless t.column_exists?(:email)
      t.string :provider unless t.column_exists?(:provider)
      t.string :uid  unless t.column_exists?(:uid)
      t.string :authic_data  unless t.column_exists?(:authic_data) 
      
      t.string :first_name unless t.column_exists?(:first_name) 
      t.string :last_name unless t.column_exists?(:last_name) 
      t.string :full_name unless t.column_exists?(:full_name)
      t.string :mobile unless t.column_exists?(:mobile) 
      t.string :phone unless t.column_exists?(:phone) 
      t.date :birth_date unless t.column_exists?(:birth_date) 
      t.string :groups unless t.column_exists?(:groups) 
      t.string :roles unless t.column_exists?(:roles) 
      
      t.string :middle_name unless t.column_exists?(:middle_name) 
      t.string :gender unless t.column_exists?(:gender) 
      t.string :timezone unless t.column_exists?(:timezone) 
      t.string :country unless t.column_exists?(:country) 
      t.string :address unless t.column_exists?(:address) 
      
      t.index :email, :unique => true unless t.index_exists?(:email, :unique => true)
      t.index :provider unless t.index_exists?(:provider)
      t.index :uid unless t.index_exists?(:uid)

<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end