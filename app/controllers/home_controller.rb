class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @today = DateTime.now
    @today_utc = Time.new(@today.year, @today.month, @today.day, 0, 0, 0, 0).utc
    @week_start = @today_utc - Time.now.wday.days
    @week_end = @week_start + 1.week

    @deductions = current_user.deductions.paginate(:page => params[:page], :per_page => 10).where('created_at between ? and ?', @week_start, @week_end).order("created_at DESC, budget_id ASC")

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @deductions }
    end
  end
end
