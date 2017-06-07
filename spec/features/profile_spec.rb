require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test123@test.com", password: "test123", password_confirmation: "test123", first_name: "John", last_name: "Snow", phone_number: 1234567890)
    login_as(@user, :scope => :user)
    visit profile_path
  end

  describe 'profile page' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
  end
end


# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.integer "sign_in_count", default: 0, null: false
# t.datetime "current_sign_in_at"
# t.datetime "last_sign_in_at"
# t.string "current_sign_in_ip"
# t.string "last_sign_in_ip"
# t.string "first_name"
# t.string "last_name"
# t.string "type"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["email"], name: "index_users_on_email", unique: true
# t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
