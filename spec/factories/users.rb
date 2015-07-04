FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password1"
    password_confirmation "password1"
    sign_in_count 0
    failed_attempts 0
    confirmed_at Date.today
  end
end
