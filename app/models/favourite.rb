class Favourite < ActiveRecord::Base
  attr_accessible :amount, :budget_id, :description, :name, :user_id
  
  has_one :budget
  has_one :user
end
