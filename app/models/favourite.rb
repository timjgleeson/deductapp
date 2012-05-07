class Favourite < ActiveRecord::Base
  attr_accessible :amount, :budget_id, :description, :name, :user_id, :tag_list
  
  acts_as_taggable
  
  belongs_to :budget
  belongs_to :user
end
