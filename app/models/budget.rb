class Budget < ActiveRecord::Base
  attr_accessible :amount, :name, :usage

 	validates :name, :presence => true
  validates :usage, :presence => true
  validates :amount, :presence => true
  
	validates :amount, :numericality => true

  has_many :transactions
  has_many :deductions
  has_many :additions
  has_and_belongs_to_many :users
  has_many :favourites
end
