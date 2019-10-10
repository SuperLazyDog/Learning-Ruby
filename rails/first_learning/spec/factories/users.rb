FactoryBot.define do
  sequence :usernames do |i|
    "user-#{i}"
  end
  factory :user do
    username { generate :usernames }
  end
end
