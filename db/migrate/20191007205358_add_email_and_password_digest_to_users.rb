class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string, null: false 
    add_column :users, :password_digest, :string, null: false
    add_column :users, :session_token, :string, null: false
    add_column :users, :cheers, :integer

    add_index :users, :email, unique: true 
    add_index :users, :password_digest, unique: true
  end


end
