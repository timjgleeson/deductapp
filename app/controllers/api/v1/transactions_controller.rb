class Api::V1::TransactionsController < ApiController
  respond_to :json
  before_filter :check_file
  before_filter :check_token
  before_filter :verify_authenticity_token
  
  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    
    @transactions = current_user.transactions.order('created_at DESC').limit(limit).offset(offset).select("name, amount, description, transaction_type, budget_id")
    
    render :status=>200, :json=>@transactions
  end

  def show
    @transaction = current_user.transactions.find(params[:id]) || not_found
    
    render :status=>200, :json=>@transaction
  end
end
