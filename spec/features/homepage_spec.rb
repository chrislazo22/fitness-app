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
      expect(page).to have_content("Create New Workout Plan")
      expect(page.status_code).to eq(200)
    end
  end
end
