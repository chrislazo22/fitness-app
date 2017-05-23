require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do
  describe do
    before do
      @plan = WorkoutPlan.create( gender: "Male", height: "5 11", weight: "180", fitness_level: "Itermediate", goal: "Weight Loss", age: "25")
    end

    it 'can be created' do
      expect(@plan).to be_valid
    end

    it 'cannot be create without apporiate information' do
      @plan.gender = nil
      @plan.height = nil
      @plan.weight = nil
      @plan.fitness_level = nil
      @plan.goal = nil
      expect(@plan).to_not be_valid
    end
  end
end
