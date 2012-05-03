class AddUseridToDeduction < ActiveRecord::Migration
  def change
    add_column :deductions, :user_id, :integer
    Deduction.update_all(:user_id => 1)
  end
end
