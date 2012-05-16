class AddTypeToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :usage, :string

    Budget.update_all(:usage => 'spending')
  end
end
