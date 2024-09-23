class RatePlansController < ApplicationController
  def index
    @rate_plans = RatePlan.all
    render json: @rate_plans
  end

  def show
    @rate_plan = RatePlan.find(params[:id])
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
    @rate_plan = RatePlan.find(params[:id])
    if @rate_plan.update(rate_plan_params)
      render json: @rate_plan
    else
      render json: @rate_plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rate_plan = RatePlan.find(params[:id])
    @rate_plan.destroy
    head :no_content
  end

  private

  def rate_plan_params
    params.require(:rate_plan).permit(:room_id, :name, :slug, :detail, :price)
  end
end
