class WorkoutPlan < ApplicationRecord
  validates_presence_of :gender, :height, :weight, :fitness_level, :goal, :age
end
