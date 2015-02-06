class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.integer :user_id
      t.timestamps
    end
    add_index :job_applications, [ :job_id, :user_id ], unique: true
  end
end
