class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.string :name
      t.decimal :amount
      t.datetime :date
      t.text :description
      t.integer :budget_id

      t.timestamps
    end
  end
end
