class WorkoutPlan < ApplicationRecord
  belongs_to :user, optional: true 

  validates_presence_of :gender, :height, :weight, :fitness_level, :goal, :age
end
