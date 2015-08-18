FactoryGirl.define do
  factory :todo do
    sequence(:title) { |n| "todo ##{n + 1}" }
  end
end
