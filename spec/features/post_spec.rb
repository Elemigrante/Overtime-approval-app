require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  
  describe 'navigate to' do
    let(:user) { FactoryBot.create(:user) }
    
    before do
      login_as(user, scope: :user)
    end
    
    describe 'index' do
      let!(:post1) { FactoryBot.create(:post, user: user) }
      let!(:post2) { FactoryBot.create(:second_post, user: user) }
      
      before do
        visit posts_path
      end
      
      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end
      
      it 'has a title of Posts' do
        expect(page).to have_text(/Posts/)
      end
      
      it 'has a list of posts' do
        visit posts_path
        expect(page).to have_text(/Rationale|content/)
      end
      
      it 'does not show posts from other users' do
        another_user           = FactoryBot.create(:another_user)
        post_from_another_user = FactoryBot.create(:post,
                                                   user:      another_user,
                                                   rationale: "This post shouldn't be seen"
        )
        
        visit posts_path
        expect(page).to have_no_text(/This post shouldn't be seen/)
      end
    end
    
    describe 'new' do
      it 'has a link from the homepage' do
        visit root_path
        click_link("new_post_from_nav")
        
        expect(page.status_code).to eq(200)
      end
    end
    
    describe 'delete' do
      let!(:post) { FactoryBot.create(:post, user: user) }
      
      it "has a link to delete" do
        visit posts_path
        
        expect(page).to have_link("", href: post_path(post))
      end
      
      it 'can be deleted' do
        visit posts_path
        click_link("delete_post_#{post.id}")
        
        expect(page.status_code).to eq(200)
      end
    end
    
    describe 'create' do
      before do
        visit new_post_path
      end
      
      it 'has a new form that can be reached' do
        expect(page.status_code).to eq(200)
      end
      
      it 'can be created from new form page' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Anything rationale'
        fill_in 'post[overtime_request]', with: 4.5
        
        expect { click_button 'Save' }.to change(Post, :count).by(1)
      end
      
      it 'will have a user associated it' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'User Association'
        fill_in 'post[overtime_request]', with: 4.5
        
        click_button 'Save'
        
        expect(User.last.posts.last.rationale).to eq('User Association')
      end
    end
    
    describe 'edit' do
      let!(:post) { FactoryBot.create(:post, user: user) }
      
      it 'can be reached by clicking edit on index page' do
        visit posts_path
        click_link("edit_#{post.id}")
        expect(page.status_code).to eq(200)
      end
      
      it 'can be edited' do
        visit edit_post_path(post)
        
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Edited content'
        click_button 'Save'
        expect(page).to have_text('Edited content')
      end
      
      it 'can not be edited by a non authorized user' do
        logout(:user)
        non_authorized_user = FactoryBot.create(:non_authorized_user)
        login_as(non_authorized_user, scope: :user)
        
        visit edit_post_path(post)
        expect(current_path).to eq(root_path)
      end
    end
  end
end
