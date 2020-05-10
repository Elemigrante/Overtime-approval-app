require 'rails_helper'

RSpec.feature 'Approval workflow' do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  before do
    login_as(admin_user, scope: :user)
  end
  
  describe "edit" do
    let!(:post) { FactoryBot.create(:post) }
    
    before do
      visit edit_post_path(post)
    end
    
    it 'can not be eddited by a non admin' do
      logout :user
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit edit_post_path(post)

      expect(page).to have_no_content("Submitted")
    end
    
    context "when it have submitted status" do
      it "sets the post to a approved status" do
        choose "post_status_approved"
        click_button "Save"
        
        expect(post.reload.approved?).to be_truthy
      end
      
      it "sets the post to a rejected status" do
        choose "post_status_rejected"
        click_button "Save"
        
        expect(post.reload.rejected?).to be_truthy
      end
    end
    
    context "when it have approved status" do
      before do
        post.update(status: "approved")
      end
      
      it "sets the post to a submitted status" do
        choose "post_status_submitted"
        click_button "Save"
        
        expect(post.reload.submitted?).to be_truthy
      end
      
      it "sets the post to a rejected status" do
        choose "post_status_rejected"
        click_button "Save"
        
        expect(post.reload.rejected?).to be_truthy
      end
    end
    
    context "when it have rejected status" do
      before do
        post.update(status: "rejected")
      end
      
      it "sets the post to a submitted status" do
        choose "post_status_submitted"
        click_button "Save"
        
        expect(post.reload.submitted?).to be_truthy
      end
      
      it "sets the post to a rejected status" do
        choose "post_status_approved"
        click_button "Save"
        
        expect(post.reload.approved?).to be_truthy
      end
    end
  
  end
end