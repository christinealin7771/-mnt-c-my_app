class MeetingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @meeting = Meeting.new(user_id: current_user.id)
  end

  def index
    @meetings = current_user.meetings.all
  end

  def create
    @meeting = Meeting.create(meeting_params)
    if @meeting.save
      redirect_to meetings_path, notice: "Event added to Calendar"
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to meetings_path, notice: "Event Updated"
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    if @meeting.destroy
      redirect_to meetings_path, notice: "Event Deleted"
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(:event, :start_time, :end_time, :done, :user_id)
    end
end

