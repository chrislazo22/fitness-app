class WorkoutPlan < ApplicationRecord
  has_many :users, dependent: :destroy

  validates_presence_of :gender, :height, :weight, :fitness_level, :goal, :age
end
