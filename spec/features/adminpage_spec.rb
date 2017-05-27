require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow")
    login_as(@user, :scope => :user)
  end

    describe 'admin page' do
      it 'can be reached succesfully' do
        visit admin_dashboard_index_path
        expect(page.status_code).to eq(200)
      end
    end

    describe 'workouts page' do
      it 'can be reached succesfully' do
        visit admin_workouts_path
        expect(page.status_code).to eq(200)
      end

      it 'has the proper content' do
        visit admin_workouts_path
        expect(page).to have_content('Workout Name')
      end
    end
  end
