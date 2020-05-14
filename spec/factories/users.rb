FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }
  
  factory :user do
    first_name { 'John' }
    last_name { 'Wick' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end
  
  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end

  factory :non_authorized_user, class: 'User' do
    first_name { 'Non' }
    last_name { 'AuthorizedUser' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end
  
  factory :another_user, class: 'User' do
    first_name { 'Another' }
    last_name { 'User' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end
end
