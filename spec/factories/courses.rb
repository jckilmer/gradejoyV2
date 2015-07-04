FactoryGirl.define do
  factory :course do
    name "Latin"
    time { Faker::Time.between(2.days.ago, Date.today) }
    period "2C"
    section "2A"
    user
  end
end
