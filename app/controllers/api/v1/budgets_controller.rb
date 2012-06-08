class Api::V1::BudgetsController < ApiController
  respond_to :json
  before_filter :check_file
  before_filter :check_token
  before_filter :verify_authenticity_token
  
  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    
    _budgets = current_user.budgets.limit(limit).offset(offset)
    
    budgets = Hash['budgets' => _budgets]
    render :status=>200, :json=>budgets
  end

  def show
    limit = params[:limit] || 10
    offset = params[:offset] || 0

    _budget = current_user.budgets.find(params[:id])
    _transactions = _budget.transactions.order('created_at DESC').limit(limit).offset(offset).select("id, name, amount, description, transaction_type")
    
    budget = Hash['id' => _budget.id, 'name' => _budget.name, 'amount' => _budget.amount, 'budget_type' => _budget.budget_type, 'transactions' => _transactions]
    render :status=>200, :json=>budget
  end
end
