FactoryBot.define do
  sequence :isbn do |p|
    "UUID-#{11111*p}"
  end
  trait :book_attr do
    title { "factory sample" }
    isbn { generate :isbn }
  end
  factory :book do
    book_attr
    factory :sample do
      title { "sample" }
    end
  end
  # factory :sample, parent: :book do
  #   title { "sample" }
  # end
end
