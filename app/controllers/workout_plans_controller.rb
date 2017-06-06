class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show]
  def index
  end

  def new
    @plan = WorkoutPlan.new
  end

  def create
    @plan = WorkoutPlan.new(workout_plan_params)
    @plan.user_id = current_user.id

    if @plan.save
      redirect_to workout_plan_path(@plan), notice: 'Your workout plan is ready'
    else
      render :new
    end
  end

  def show
    @plan = WorkoutPlan.find(params[:id])
  end

  def profile
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal, :user_id)
  end

  def set_workout_plan
    @plan = WorkoutPlan.find(params[:id])
  end
end
