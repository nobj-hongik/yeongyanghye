class CalendarController < ApplicationController
  
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events = Event.all

  end
  
  def index
        @user = current_user
  end
    
    
end

