class MeetingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @meeting = Meeting.new()
  end

  def show
    @meeting = Meeting.find(current_user)
  end

  def edit
  end

  def create
    @meeting = Meeting.create(meeting_params)

    if @meeting.save
      redirect_to calendar_mainCalendar_path, notice: "Event added to Calendar"
    else
      render :new
    end
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: "Event Updated"
    else
      render :edit
    end
  end

  def destroy
    if @meeting.destroy
      redirect_to calendar_mainCalendar_path, notice: "Event deleted"
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(:event, :start_time, :end_time, :user_id)

    end
  end

