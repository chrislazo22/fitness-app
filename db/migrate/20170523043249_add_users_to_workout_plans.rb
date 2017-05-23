class AddUsersToWorkoutPlans < ActiveRecord::Migration[5.1]
  def change
    add_reference :workout_plans, :user, foreign_key: true
  end
end
