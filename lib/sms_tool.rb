module SmsTool
  def self.send_sms
    @user = User.find(1)
    SmsWorker.perform_async(@user.id)
  end
end

module WeeklyWorkout
  def workout
    @weekly_workout = String.new
    @current_workout_plan.each do |day, workout_id|
      @weekly_workout << "#{day}: "
      workout_id.each do |workout|
        @weekly_workout << "#{workout.name} "
        @sets.each do |k, v|
          @weekly_workout << "(Sets: #{v} "
        end
        @reps.each do |k, v|
          @weekly_workout << "Reps: #{v}), "
        end
      end
    end
  end
end
