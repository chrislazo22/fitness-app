class WorkoutPlan < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :workout

  validates_presence_of :gender, :height, :weight, :fitness_level, :goal, :age

end
