class AddUsersToEmployersAndSeekers < ActiveRecord::Migration
  def change
    add_column :seekers, :user_id, :integer
    add_column :employers, :user_id, :integer
  end
end
