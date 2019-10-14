class DropGoalAndUserCommentTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :goal_comments 
    drop_table :user_comments
  end
end
