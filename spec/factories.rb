FactoryGirl.define do
  # factory :user do
  #   sequence(:email) { |n| "fake#{n}@fake.com"}
  #   sequence(:name) { |n| "fake#{n}"}
  #   password "12345678"
  #   confirmed_at Time.now
  # end

  factory :goal do
    #user
    sequence(:goal) { |n| "Learn to Use FactoryGirl #{n}" }
    duration 140
    completed true
    objective "generate data for tests in rspec using FactoryGirl"
  end

  factory :task do
    #user
    #goal
    focus "do drills online"
    type_id 1
    completed false
    duration 20
    description "did drills on tuts plus"

    sequence(:review) { |n| "Cute cat #{n}" }
  end
end
