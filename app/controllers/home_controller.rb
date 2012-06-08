class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :week]  
  before_filter :set_time_zone

  def index
      @today = DateTime.now
      @today_start = Time.new(@today.year, @today.month, @today.day, 0, 0, 0, 0)

      @week_start = @today_start - Time.now.wday.days
      @week_end = @week_start + 1.week
      
      @transactions = current_user.transactions.where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC, budget_id ASC")

      respond_to do |format|
        format.html # home.html.erb
        format.json { render json: @deductions }
      end
  end

  def week 
    @week_start = Time.new(params[:year], params[:month], params[:day], 0, 0, 0, 0)
    @week_start = @week_start - @week_start.wday.days
    @week_end = @week_start + 1.week

    @transactions = current_user.transactions.where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC, budget_id ASC")

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @deductions }
    end
  end

  def guest

  end
end
