FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { Faker::Lorem.sentence }
    user
  end
  
  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { Faker::Lorem.sentence }
    user
  end
end
