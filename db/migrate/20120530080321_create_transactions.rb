class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :transaction_type
      t.float :amount
      t.text :description
      t.references :budget
      t.references :user

      t.timestamps
    end
    add_index :transactions, :budget_id
    add_index :transactions, :user_id
  end
end
