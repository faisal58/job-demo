class CreateSeekers < ActiveRecord::Migration
  def change
    create_table :seekers do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :objective
      t.text :career_overview
      t.integer :expected_salary
      t.string :resume_link
      t.timestamps
    end
  end
end
