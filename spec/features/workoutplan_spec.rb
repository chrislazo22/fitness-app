require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow", phone_number: 1234567890)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    it 'can be reached successfully and fill out form' do
      visit current_plan_path
      expect(page.status_code).to eq(200)
    end

    it 'displays workout plan if available' do
      @workout_plan = WorkoutPlan.create( gender: "Male", height: "5 11", weight: "180", fitness_level: "Intermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit current_plan_path
      expect(page).to have_content(/Day 1/)
    end
  end

  describe 'form' do
    it 'has a fitness questionnaire' do
      visit new_workout_plan_path
      fill_in 'Age', with: "21"
      click_on "Submit"
    end
  end
end
