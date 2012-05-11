class BugetsUsers < ActiveRecord::Migration
  def up
    create_table :budgets_users, :id => false do |t|
      t.integer :budget_id
      t.integer :user_id
    end

    Budget.all.each do |budget|
    	if !budget.user_id.nil?
    		user = User.find(budget.user_id)
    		user.budgets << budget
    	end
    end
  end

  def down
  	drop_table :budgets_users
  end
end
