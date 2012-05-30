class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  attr_accessible :amount, :description, :name, :transaction_type, :tags_list, :budget, :user, :created_at, :updated_at

  acts_as_taggable 
  
end
