require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow")
    login_as(@user, :scope => :user)
  end
  
  describe 'index' do
    it 'can be reached successfully and fill out form' do
      visit workout_plans_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'form' do
    it 'has a fitness questionnaire' do
      visit new_workout_plan_path

      # fill_in 'Gender', with: "Female"
      # fill_in 'plan[age]', with: "21"
      # fill_in 'Hegiht', with: "5 9"
      # fill_in 'fitness_level', with: "Beginner"
      # fill_in 'Goal', with: "Healthy Lifestyle"

      click_on "Submit"

      # expect(page).to have_content("something")
    end
  end
end
