class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.integer :company_type_id
      t.string :company_website
      t.string :company_logo
      t.timestamps
    end
    add_index :employers, :company_type_id
  end
end
