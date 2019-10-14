class RemoveColumnPrivateFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :private, :boolean, :default => false
  end
end
