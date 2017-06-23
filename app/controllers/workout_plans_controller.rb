class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show, :edit, :update]

  def index
    @workout_plans = WorkoutPlan.all
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

  def current_plan
    @workout_plan = WorkoutPlan.where(user_id: current_user)
    @workouts = Workout.all

    @current_workout_plan = { "Day 1" => [], "Day 2" => [], "Day 3" => [], "Day 4" => [], "Day 5" => [], "Day 6" => [], "Day 7" => [] }
    @sets = { Sets: 0 }
    @reps = { Reps: 0 }

    @workout_plan.each do |workout|
      if workout.goal == "Weight/Fat Loss"
        @current_workout_plan["Day 1"] << (@workouts.find_by name: 'Burpees') << (@workouts.find_by name: 'Renegade') << (@workouts.find_by name: 'Plank')
        @current_workout_plan["Day 2"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Day 3"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Day 4"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Day 5"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Day 6"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Day 7"] << (@workouts.find_by name: 'Rest')
      elsif workout.goal == "Build Muscle"
        @current_workout_plan["Day 1"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Day 2"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan["Day 3"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Day 4"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Day 5"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan["Day 6"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Day 7"] << (@workouts.find_by name: 'Rest')
      else workout.goal == "Increase Strength"
        @current_workout_plan["Day 1"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Barbell Lunges') << (@workouts.find_by name: 'Leg Curl')
        @current_workout_plan["Day 2"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Day 3"] << (@workouts.find_by name: 'Pull Ups') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Day 4"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Day 5"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Plank')
        @current_workout_plan["Day 6"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Day 7"] << (@workouts.find_by name: 'Rest')
      end

      @workout_plan.each do |workout|
        if workout.fitness_level == "Beginner"
          @sets[:Sets] = "3"
          @reps[:Reps] = "8"
        elsif workout.fitness_level == "Intermediate"
          @sets[:Sets] = "4"
          @reps[:Reps] = "10"
        else workout.fitness_level == "Advanced"
          @sets[:Sets] = "5"
          @reps[:Reps] = "10"
        end
      end
    end
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


  private

  def workout_plan_params
    params.require(:workout_plan).permit(:gender, :age, :height, :weight, :fitness_level, :goal, :user_id)
  end

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end
end
