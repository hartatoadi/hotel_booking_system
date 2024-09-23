class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    render json: @calendars
  end

  def show
    @calendar = Calendar.find(params[:id])
    render json: @calendar
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      render json: @calendar, status: :created
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      render json: @calendar
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    head :no_content
  end

  private

  def calendar_params
    params.require(:calendar).permit(:room_id, :rate_plan_id, :date, :availability, :price)
  end
end
