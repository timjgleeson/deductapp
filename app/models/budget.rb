class Budget < ActiveRecord::Base
  attr_accessible :amount, :name
  
  has_many :deductions
  has_one :user
end
