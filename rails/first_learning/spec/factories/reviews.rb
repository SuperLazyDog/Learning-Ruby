FactoryBot.define do
  sequence :review_bodies do |i|
    "review-#{i}"
  end
  factory :review do
    transient do
      comment { "" }
    end
    body { comment.blank? ? generate(:review_bodies) : comment }
    user
    book
  end
end
