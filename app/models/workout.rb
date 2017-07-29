class Workout < ApplicationRecord
  validates_uniqueness_of :name
end
