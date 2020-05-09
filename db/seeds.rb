@user = User.create!(email:                 'test@test.com',
             password:              'asdfasdf',
             password_confirmation: 'asdfasdf',
             first_name:            'John',
             last_name:             'Wick'
)

puts '1 User created'

AdminUser.create!(email: 'admin@user.com', first_name: 'Admin', last_name: 'User', password: 'asdfasdf', password_confirmation: 'asdfasdf')

puts '1 Admin User created'

50.times do |post|
  Post.create(date: Date.today,
               rationale: "#{post} rationale content",
               user_id: @user.id
  )
end

puts '50 Posts have been created'