class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :name
    end
    add_index :company_types, :name, :unique => true
  end
end
