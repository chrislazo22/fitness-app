require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page).to have_content("Current Workout Plan")
      expect(page).to have_content("Create New Workout Plan")
      expect(page.status_code).to eq(200)
    end
  end
end
