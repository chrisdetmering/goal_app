class CreateGoalComments < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_comments do |t|
      t.text :body, null: false 
      t.integer :goal_id, null: false 

      t.timestamps 
    end

    add_index :goal_comments, :goal_id
  end
end
