class Api::V1::BudgetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_time_zone
  respond_to :json
  
  def index
    @budgets = current_user.budgets
    render :status=>200, :json=>@budgets
  end

  def show
    @budget = Budget.find(params[:id])
    render :status=>200, :json=>@budget
  end
end
