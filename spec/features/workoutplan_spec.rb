require 'rails_helper'

describe 'navigate' do
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
