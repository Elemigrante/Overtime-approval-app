require 'rails_helper'

RSpec.feature 'AuditLog', type: :feature do
  let!(:audit_log) { FactoryBot.create(:audit_log) }
  let(:admin_user) { FactoryBot.create(:admin_user) }
  
  before do
    login_as(admin_user, scope: :user)
    visit audit_logs_path
  end
  
  describe 'index' do
    
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'renders audit log' do
      expect(page).to have_text(/WICK/)
    end
    
    xit 'cannot be accessed by non admin user' do
    
    end
  end
end