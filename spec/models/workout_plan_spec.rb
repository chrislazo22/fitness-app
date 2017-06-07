require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do
  describe do
    before do
      @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow")
      @plan = WorkoutPlan.create( gender: "Male", height: "5 11", weight: "180", fitness_level: "Itermediate", goal: "Weight Loss", age: "25", user_id: 1)
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
      @plan.user = nil
      expect(@plan).to_not be_valid
    end
  end
end
