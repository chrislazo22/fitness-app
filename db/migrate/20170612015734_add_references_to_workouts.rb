class AddReferencesToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_reference :workouts, :workout_plan, foreign_key: true
  end
end
