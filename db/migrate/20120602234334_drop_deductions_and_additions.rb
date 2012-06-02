class DropDeductionsAndAdditions < ActiveRecord::Migration
  def up
    drop_table :deductions
    drop_table :additions
  end

  def down
  end
end
