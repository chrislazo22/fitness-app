class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show, :edit, :update, :destroy]

  def index
    @workout_plan = WorkoutPlan.where(user_id: current_user)
  end

  def show
  end

  def new
    @workout_plan = WorkoutPlan.new
  end

  def edit
  end

  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)
    @workout_plan.user_id = current_user.id

    if @workout_plan.save
      redirect_to current_plan_path, notice: 'Your workout plan is ready'
    else
      render :new
    end
  end

  def profile
    @workout_plan = WorkoutPlan.where(user_id: current_user)
  end

  def update
    respond_to do |format|
      if @workout_plan.update(workout_plan_params)
        format.html { redirect_to @workout_plan, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workout_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workout_plan.delete
    redirect_to current_plan_path, notice: 'Your post was deleted'
  end


  private

  def workout_plan_params
    params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal, :user_id)
  end

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end
end
