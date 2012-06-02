class RemoveUserIdFromBudgets < ActiveRecord::Migration
  def up
    remove_column :budgets, :user_id
  end

  def down
    add_column :budgets, :user_id, :integer
  end
end
