class RemoveReferencesFromWorkouts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :workouts, :workout_plan, foreign_key: true
  end
end
