require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    before do
      @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow")
      login_as(@user, :scope => :user)
    end

    it 'can be reached successfully' do
      visit root_path
      expect(page).to have_content("Current Workout Plan")
      expect(page).to have_content("New Workout Plan")
      expect(page.status_code).to eq(200)
    end

    it 'displays workout plan if available' do
      @workout_plan = WorkoutPlan.create( gender: "Male", height: "5 11", weight: "180", fitness_level: "Itermediate", goal: "Weight Loss", age: "25", user_id: 1)
      visit root_path
      expect(page).to have_content(/WorkoutPlan/)
    end
  end
end


#refactor root_page call

# create_table "workout_plans", force: :cascade do |t|
#   t.string "gender"
#   t.integer "height"
#   t.integer "weight"
#   t.string "fitness_level"
#   t.string "goal"
#   t.integer "age"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id"
#   t.index ["user_id"], name: "index_workout_plans_on_user_id"
