class Api::V1::TransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_time_zone
  respond_to :json
  
  def index
    @transactions = current_user.transactions
    render :status=>200, :json=>@transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render :status=>200, :json=>@transaction
  end
end
