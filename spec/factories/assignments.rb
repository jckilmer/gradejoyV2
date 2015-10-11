FactoryGirl.define do
  factory :assignment do
    name "Test 1"
    date_due { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    category "Tests"
    points_earned { Faker::Number.number(2) }
    total_points 100
    course
    user
  end
end
