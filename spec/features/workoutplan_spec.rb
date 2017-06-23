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
      @workout_plan = nil
      visit current_plan_path
      expect(page).to have_content(/Create/)
    end
  end

  describe 'form' do
    it 'has a fitness questionnaire' do
      visit new_workout_plan_path
      fill_in 'Age', with: "21"
      click_on "Submit"
    end
  end

  describe 'show page' do
    it 'can be reached succefully' do
      @workout_plan = WorkoutPlan.create(id: 1, gender: "Male", height: "5 11", weight: "180", fitness_level: "Intermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit workout_plan_path(@workout_plan)
      expect(page.status_code).to eq(200)
    end

    it 'can go back to current page' do
      @workout_plan = WorkoutPlan.create(id: 1, gender: "Male", height: "5 11", weight: "180", fitness_level: "Intermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit workout_plan_path(@workout_plan)
      expect(page).to have_content(/Back/)
    end
  end
  describe 'edit' do
    it 'can be reached successfully' do
      @workout_plan = WorkoutPlan.create(id: 1, gender: "Male", height: "5 11", weight: "180", fitness_level: "Intermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit edit_workout_plan_path(@workout_plan)

      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @workout_plan = WorkoutPlan.create(id: 1, gender: "Male", height: "5 11", weight: "180", fitness_level: "Intermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit workout_plan_path(@workout_plan)

      click_link(/Delete/)
      expect(page.status_code).to eq(200)
    end
  end
end
