class Budget < ActiveRecord::Base
  attr_accessible :amount, :name
  
  has_many :deductions
  belongs_to :user
  has_many :favourites
end
