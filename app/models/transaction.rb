class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  attr_accessible :amount, :description, :name, :transaction_type, :tag_list, :budget_id

  acts_as_taggable 
  
end
