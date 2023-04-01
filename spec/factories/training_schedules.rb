FactoryBot.define do
  factory :training_schedule do
    association :training_plan
    association :exercise
    week_day { rand(0..6) }
  end
end
