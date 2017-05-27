class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :workout_type
      t.string :muscle_worked
      t.string :equipment
      t.string :difficulty

      t.timestamps
    end
  end
end
