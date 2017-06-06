class Workout < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      workout_hash = row.to_hash
      workout = Workout.where(id: workout_hash["id"])

      if workout.count == 1
        workout.first.update_attributes.(workout_hash)
      else
        Workout.create!(workout_hash)
      end
    end
  end
end
