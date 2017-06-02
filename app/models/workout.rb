class Workout < ApplicationRecord
  require 'csv'

  CSV.foreach("app/assets/workout_list.csv", headers: true) do |row|
    Workout.create row.to_hash
  end
end
