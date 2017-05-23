class CreateWorkoutPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_plans do |t|
      t.string :gender
      t.integer :height
      t.integer :weight
      t.string :fitness_level
      t.string :goal
      t.integer :age

      t.timestamps
    end
  end
end
