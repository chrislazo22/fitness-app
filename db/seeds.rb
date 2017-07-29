# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'workouts.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  workout_hash = row.to_hash
  workout = Workout.where(id: workout_hash["id"])

  if workout.count == 1
    workout.first.update_attributes.(workout_hash)
  else
    Workout.create!(workout_hash)
  end
end

puts "#{Workout.count}"
