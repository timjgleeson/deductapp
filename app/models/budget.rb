class Budget < ActiveRecord::Base
  attr_accessible :amount, :name

 	validates :name, :presence => true
  validates :amount, :presence => true
  validates :user_id, :presence => true
  
	validates :amount, :numericality => true

  has_many :deductions
  belongs_to :user
  has_many :favourites
end
