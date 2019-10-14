class AddColumnPrivateToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :private?, :boolean, :default => false
  end
end
