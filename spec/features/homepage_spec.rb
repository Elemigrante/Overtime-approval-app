require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
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