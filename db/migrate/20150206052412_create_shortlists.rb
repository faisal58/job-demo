class CreateShortlists < ActiveRecord::Migration
  def change
    create_table :shortlists do |t|
      t.integer :employer_id
      t.integer :seeker_id
      t.timestamps
    end
  end
end
