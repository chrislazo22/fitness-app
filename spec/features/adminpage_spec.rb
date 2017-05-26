require 'rails_helper'

describe 'navigate' do
  describe 'admin page' do
    it 'can be reached succesfully' do
      visit admin_dashboard_index_path
      expect(page.status_code).to eq(200)
    end
  end
end
