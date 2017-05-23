class WorkoutPlansController < ApplicationController
  def index
  end

  def new
    @plan = WorkoutPlan.new
  end

  def create
    @plan = WorkoutPlan.new(params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal))
    if @plan.save
      redirect_to workout_plan_path(@plan)
    else
      render :new
    end
  end

  def show
    @plan = WorkoutPlan.find(params[:id])
  end
end
