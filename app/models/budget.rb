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

  public 
    
  def icon
    if usage == 'spending'
      'shopping-cart'
    else
      'bar-chart'
    end
  end

  def current_amount(year, month, day)
    @week_start = Time.new(year, month, day, 0, 0, 0, 0)
    @week_end = @week_start + 1.week

    if usage == 'spending'
      amount_for_week_left = amount
      transactions.where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC").each do |transaction|
        if transaction.transaction_type == 1
          amount_for_week_left = amount_for_week_left - transaction.amount
        else
          amount_for_week_left = amount_for_week_left + transaction.amount
        end
      end
      amount_for_week_left
    else
      20
    end
  end
end
