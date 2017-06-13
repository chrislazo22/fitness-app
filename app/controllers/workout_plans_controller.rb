class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show]

  def index
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

  def current_plan
    @workout_plan = WorkoutPlan.where(user_id: current_user)
    @workouts = Workout.all

    @current_workout_plan = { day_1: [], day_2: [], day_3: [], day_4: [], day_5: [], day_6: [], day_7: [] }

    @workout_plan.each do |workout|
      if workout.goal == "Weight/Fat Loss"
        @current_workout_plan[:day_1] << (@workouts.find_by name: 'Burpees') << (@workouts.find_by name: 'Renegade') << (@workouts.find_by name: 'Plank')
        @current_workout_plan[:day_2] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan[:day_4] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan[:day_5] << (@workouts.find_by name: 'Cardio')
      elsif workout.goal == "Build Muscle"
        @current_workout_plan[:day_1] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan[:day_2] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan[:day_4] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan[:day_5] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan[:day_6] << (@workouts.find_by name: 'Cardio')
      else workout.goal == "Increase Strength"
        @current_workout_plan[:day_1] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Barbell Lunges') << (@workouts.find_by name: 'Leg Curl')
        @current_workout_plan[:day_2] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan[:day_3] << (@workouts.find_by name: 'Pull Ups') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan[:day_5] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Plank')
        @current_workout_plan[:day_6] << (@workouts.find_by name: 'Cardio')
      end
    end
  end


  private

  def workout_plan_params
    params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal, :user_id)
  end

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end
end
