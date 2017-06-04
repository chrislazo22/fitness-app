class Workout < ApplicationRecord
  require 'csv'

  CSV.foreach("app/assets/workout_list.csv", headers: true) do |row|
    workout_hash = row.to_hash
    Workout.create!(workout_hash)
  end
end
