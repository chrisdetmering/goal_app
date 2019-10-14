class CreateUserComment < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.text :body, null: false 
      t.integer :user_id, null: false 

      t.timestamps 
    end

    add_index :user_comments, :user_id
  end
end
