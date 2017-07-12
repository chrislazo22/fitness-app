module WorkoutPlansHelper
  def exercises
    today = Date.today.strftime('%A')

    todays_workout = current_plan[today].map(&:name).to_s
    return todays_workout
  end

  def sets_and_reps
    scheme = {}
    workout_plan.each do |workout|
      if workout.fitness_level == "Beginner"
        scheme[:sets] = "3"
        scheme[:reps] = "8"
      elsif workout.fitness_level == "Intermediate"
        scheme[:sets] = "4"
        scheme[:reps] = "10"
      else workout.fitness_level == "Advanced"
        scheme[:sets] = "5"
        scheme[:reps] = "10"
      end
    end

    return "Sets: #{scheme[:sets]}, Reps: #{scheme[:reps]}"

  end

  private

  attr_reader :user_id

  def workout_plan
    WorkoutPlan.where(user_id: current_user)
  end


  def current_plan
    @workouts = Workout.all

    @current_workout_plan = { "Monday" => [], "Tuesday" => [], "Wednesday" => [], "Thursday" => [], "Friday" => [], "Saturday" => [], "Sunday" => [] }
    @sets = { Sets: 0 }
    @reps = { Reps: 0 }

    workout_plan.each do |workout|
      if workout.goal == "Weight/Fat Loss"
        @current_workout_plan["Monday"] << (@workouts.find_by name: 'Burpees') << (@workouts.find_by name: 'Renegade') << (@workouts.find_by name: 'Plank')
        @current_workout_plan["Tuesday"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Wednesday"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Thursday"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Friday"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Saturday"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Sunday"] << (@workouts.find_by name: 'Rest')
      elsif workout.goal == "Build Muscle"
        @current_workout_plan["Monday"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Tuesday"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan["Wednesday"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Thursday"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Lat Pull Down') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Friday"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Deadlift') << (@workouts.find_by name: 'Calf Raise')
        @current_workout_plan["Saturday"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Sunday"] << (@workouts.find_by name: 'Rest')
      else workout.goal == "Increase Strength"
        @current_workout_plan["Monday"] << (@workouts.find_by name: 'Barbell Squat') << (@workouts.find_by name: 'Barbell Lunges') << (@workouts.find_by name: 'Leg Curl')
        @current_workout_plan["Tuesday"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Wednesday"] << (@workouts.find_by name: 'Pull Ups') << (@workouts.find_by name: 'Barbell Row') << (@workouts.find_by name: 'Barbell Curl')
        @current_workout_plan["Thursday"] << (@workouts.find_by name: 'Rest')
        @current_workout_plan["Friday"] << (@workouts.find_by name: 'Bench Press') << (@workouts.find_by name: 'Military Press') << (@workouts.find_by name: 'Plank')
        @current_workout_plan["Saturday"] << (@workouts.find_by name: 'Cardio')
        @current_workout_plan["Sunday"] << (@workouts.find_by name: 'Rest')
      end
    end

    return @current_workout_plan
  end
end
