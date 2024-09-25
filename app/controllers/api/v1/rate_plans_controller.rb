class Api::V1::RatePlansController < Api::V1::BaseController
  before_action :set_rate_plan, only: [:show, :update, :destroy]

  def index
    @rate_plans = RatePlan.all
    render json: @rate_plans
  end

  def show
    render json: @rate_plan
  end

  def create
    @rate_plan = RatePlan.new(rate_plan_params)
    if @rate_plan.save
      render json: @rate_plan, status: :created
    else
      render json: @rate_plan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @rate_plan.update(rate_plan_params)
      render json: @rate_plan
    else
      render json: @rate_plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rate_plan.destroy
    head :no_content
  end

  private

  def set_rate_plan
    @rate_plan = RatePlan.find(params[:id])
  end


  def rate_plan_params
    params.require(:rate_plan).permit(:room_id, :name, :slug, :detail, :price)
  end
end
