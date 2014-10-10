FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com"}
    sequence(:username) { |n| "fake#{n}"}
    sequence(:first_name) { |n| "Fakey#{n}"}
    sequence(:last_name) { |n| "McFakerson#{n}"}
    password "12345678"
    # confirmed_at Time.now
  end

  factory :goal do
    user
    sequence(:name) { |n| "Learn Ruby #{n}" }
    duration 140
    completed true
    secret false
    objective "use inheritance wisely"
  end

  factory :task do
    user
    goal
    focus "Inheritance Drills"
    methodology
    completed false
    secret false
    duration 20
    description "did drills on Ruby Monk, found them to be useful"
    action_url "https://www.rubymonk.com"
  end

  factory :methodology do
    sequence(:name) { |n| Methodology.types.sample }
  end
end
