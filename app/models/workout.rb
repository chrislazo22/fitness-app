class Workout < ApplicationRecord
  require 'csv'
  validates_uniqueness_of :name
end
