class AddUseridToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :user_id, :integer
    Budget.update_all(:user_id => 1)
  end
end
