class Transaction < ActiveRecord::Base
 attr_accessible :amount, :description, :name, :transaction_type, :tag_list, :budget_id

  validates :name, :presence => true
  validates :amount, :presence => true
  validates :user_id, :presence => true
  validates :budget_id, :presence => true
  validates :transaction_type, :presence => true

  validates :amount, :numericality => true

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
