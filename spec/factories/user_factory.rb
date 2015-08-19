FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }

    factory :user_with_todos do
      after(:create) do |user|
        create_list(:todo, 2, title: "#{user.email}'s todo", user: user)
      end
    end
  end
end
