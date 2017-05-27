require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe do
    before do
      @workout = Workout.create(name: "Bench press", workout_type: "Strength", muscle_worked: "Chest", equipment: "Barbell", difficulty: "Beginner")
    end

    it "can be created" do
      expect(@workout).to be_valid
    end
  end
end



# create_table :workouts do |t|
  #t.string :name
  #t.string :workout_type
  #t.string :muscle_worked
  #t.string :equipment
  #t.string :difficulty

  #t.timestamps
