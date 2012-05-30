class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  attr_accessible :amount, :description, :name, :transaction_type, :tags_list, :budget

  acts_as_taggable 
  
end
