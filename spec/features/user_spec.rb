require 'rails_helper'

describe 'user sign up' do
  it 'can sign up with user attributes' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test123@test.com'
    fill_in 'Password', with: 'test123'
    fill_in 'Password Confirmation', with: 'test123'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Snow'
    fill_in 'Phone Number', with: '1234567890'

    click_on 'Sign up'

    expect(page).to have_content("Welcome")
  end
end
