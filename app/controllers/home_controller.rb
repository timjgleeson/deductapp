class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_time_zone

  def index
    @today = DateTime.now
    @today_start = Time.new(@today.year, @today.month, @today.day, 0, 0, 0, 0)

    @week_start = @today_start - Time.now.wday.days
    @week_end = @week_start + 1.week

    @deductions = current_user.deductions.paginate(:page => params[:page], :per_page => 10).where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC, budget_id ASC")

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @deductions }
    end
  end

  def week 
    @week_start = Time.new(params[:year], params[:month], params[:day], 0, 0, 0, 0)
    @week_start = @week_start - @week_start.wday.days
    @week_end = @week_start + 1.week - 1.day

    @deductions = current_user.deductions.paginate(:page => params[:page], :per_page => 10).where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC, budget_id ASC")

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @deductions }
    end
  end

end
