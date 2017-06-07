require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow", phone_number: 1234567890)
    end

    it "can create users" do
      expect(@user).to be_valid
    end

    it "cannot be created without first and last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it "should ensure all emails are unique" do
      duplicate_email_user = User.create(email: "test123@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Snow")
      expect(duplicate_email_user).not_to be_valid
    end
  end
end
