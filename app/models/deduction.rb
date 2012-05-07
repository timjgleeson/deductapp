class Deduction < ActiveRecord::Base
  attr_accessible :amount, :budget_id, :date, :description, :name, :tag_list
  
  acts_as_taggable
  
  belongs_to :budget
  belongs_to :user
end
