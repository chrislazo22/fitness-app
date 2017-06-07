class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show]

  def index
    @workout_plans = WorkoutPlan.all
  end

  def new
    @workout_plan = WorkoutPlan.new
  end

  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)
    @workout_plan.user_id = current_user.id

    if @workout_plan.save
      redirect_to workout_plan_path(@workout_plan), notice: 'Your workout plan is ready'
    else
      render :new
    end
  end

  def show
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  def profile
    @workout_plans = WorkoutPlan.all
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal, :user_id)
  end

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end
end
