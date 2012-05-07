class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @today = DateTime.now
    @today_utc = Time.new(@today.year, @today.month, @today.day, 0, 0, 0, 0).utc
    @week_start = @today_utc - Time.now.wday.days
    @week_end = @week_start + 1.week

    @deductions = current_user.deductions
    @this_weeks_deductions = current_user.deductions.where('date between ? and ?', @week_start, @week_end).order("date ASC").order("date DESC")
    @latest_deductions = current_user.deductions.limit(5).order("date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deductions }
    end
  end
end
