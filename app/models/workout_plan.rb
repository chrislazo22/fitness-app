class WorkoutPlan < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates_presence_of :gender, :height, :weight, :fitness_level, :goal, :age
end
