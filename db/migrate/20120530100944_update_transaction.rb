class UpdateTransaction < ActiveRecord::Migration
  def up
    Deduction.all.each do |deduction|
      transaction = Transaction.new(:name => deduction.name, :amount => deduction.amount, :description => deduction.description, :budget => deduction.budget, :user => deduction.user, :created_at => deduction.created_at, :updated_at => deduction.updated_at, :transaction_type => 1)
      transaction.save
    end
    
    Addition.all.each do |addition|
      transaction = Transaction.new(:name => addition.name, :amount => addition.amount, :description => addition.description, :budget => addition.budget, :user => addition.user, :created_at => addition.created_at, :updated_at => addition.updated_at, :transaction_type => 2)
      transaction.save
    end 
  end

  def down
    Transaction.delete_all
  end
end
