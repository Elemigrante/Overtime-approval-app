require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  context 'when logged in as admin' do
    let(:admin_user) { FactoryBot.create(:admin_user) }
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, user: user) }
    
    before do
      login_as(admin_user, scope: :user)
      visit root_path
    end
    
    it 'allows the admin to approve posts from the homepage' do
      click_link "approve_#{post.id}"
      
      expect(post.reload.status).to eq('approved')
    end
  end
  
  context "when logged in as a user" do
    let(:user) { FactoryBot.create(:user) }
    let!(:audit_log) { FactoryBot.create(:audit_log, user: user) }
    
    before do
      login_as(user, scope: :user)
      visit root_path
    end
    
    it 'allows the user(employee) to change audit log status from the homepage' do
      click_link "confirm_#{audit_log.id}"
      
      expect(audit_log.reload.status).to eq('confirmed')
    end
  end
end