class RemoveDateFromDeduction < ActiveRecord::Migration
  def change
    remove_column :deductions, :date
  end
end
