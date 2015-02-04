class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :role
    end
  end
end
