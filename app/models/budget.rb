class Budget < ActiveRecord::Base
  attr_accessible :amount, :name

 	validates :name, :presence => true
  validates :amount, :presence => true
  
	validates :amount, :numericality => true

  has_many :deductions
  has_and_belongs_to_many :users
  has_many :favourites
end
