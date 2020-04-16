require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do
    @user = User.create!(email:                 'test@test.com',
                         password:              'asdfasdf',
                         password_confirmation: 'asdfasdf',
                         first_name:            'John',
                         last_name:             'Wick'
    )
    login_as(@user, scope: :user)
  end
  
  describe 'navigate' do
    describe 'index' do
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
        post1 = Post.create!(date: Date.today, rationale: 'Post1', user_id: @user.id)
        post2 = Post.create!(date: Date.today, rationale: 'Post2', user_id: @user.id)
        visit posts_path
        expect(page).to have_text(/Post1|Post2/)
      end
    end
  end
  
  describe 'creation' do
    before do
      visit new_post_path
    end
    
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end
    
    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Anything rationale'
      click_button 'Save'
      expect(page).to have_text('Anything rationale')
    end
    
    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_button 'Save'
      
      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end
end
