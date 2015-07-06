FactoryGirl.define do
  factory :help_request do
    email { Faker::Internet.email }
    message "How do I print out students' grades for a course?"
    user
  end
end
