class RenameUsageToBudgetTypeInBudgets < ActiveRecord::Migration
  def up
    rename_column :budgets, :usage, :budget_type
  end

  def down
  end
end
