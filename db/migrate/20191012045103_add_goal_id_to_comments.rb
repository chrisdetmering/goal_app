class AddGoalIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :goal_id, :integer 
    remove_column :comments, :author_id, :integer 
  end
end
