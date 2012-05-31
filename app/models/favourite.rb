class Favourite < ActiveRecord::Base
  attr_accessible :amount, :budget_id, :description, :name, :user_id, :tag_list, :transaction_type

  validates :name, :presence => true
  validates :amount, :presence => true
  validates :user_id, :presence => true
  validates :transaction_type, :presence => true

  validates :amount, :numericality => true
  validates :transaction_type, :numericality => true

  acts_as_taggable
  
  belongs_to :budget
  belongs_to :user

  public

  def icon
    if transaction_type === 1
      'minus'
    else
      'plus'
    end
  end
end
