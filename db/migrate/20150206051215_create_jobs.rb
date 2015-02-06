class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :job_category_id
      t.string :title
      t.string :location
      t.text :description
      t.integer :salary_range
      t.date :application_deadline
      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :job_category_id
  end
end
