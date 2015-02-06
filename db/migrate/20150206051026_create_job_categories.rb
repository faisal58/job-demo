class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.string :name
    end
    add_index :job_categories, :name, :unique => true
  end
end
