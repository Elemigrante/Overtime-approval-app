@user = User.create!(email:                 'test@test.com',
                     password:              'asdfasdf',
                     password_confirmation: 'asdfasdf',
                     first_name:            'John',
                     last_name:             'Wick',
                     phone:                 '2067372644'
)

puts '1 User created'

AdminUser.create!(email:                 'admin@user.com',
                  first_name:            'Admin',
                  last_name:             'User',
                  password:              'asdfasdf',
                  password_confirmation: 'asdfasdf',
                  phone:                 '2067372644'
)

puts '1 Admin User created'

AuditLog.create(
  user_id:    @user.id,
  status:     0,
  start_date: Date.today - 6.days
)

AuditLog.create(
  user_id:    @user.id,
  status:     0,
  start_date: Date.today - 13.days
)

AuditLog.create(
  user_id:    @user.id,
  status:     0,
  start_date: Date.today - 20.days
)

puts '3 AuditLogs have been created'

100.times do |post|
  Post.create(date:             Date.today,
              rationale:        Faker::Lorem.paragraph,
              user_id:          @user.id,
              overtime_request: 2.5
  )
end

puts '50 Posts have been created'