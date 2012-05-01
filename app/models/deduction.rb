class Deduction < ActiveRecord::Base
  attr_accessible :amount, :budget_id, :date, :description, :name
  
  has_one :budget
end
