FactoryBot.define do
  factory :training_plan do
    description { ['Easy Training', 'Intermediate Training', 'Advanced Training'].sample }
    association :user

    trait :with_schedule do
      transient do
        exercise_name { 'Barbell Biceps' }
        category_name { 'Biceps' }
      end

      after(:create) do |training_plan, evaluator|
        category = create(:exercise_category, name: evaluator.category_name)
        exercise = create(:exercise, name: evaluator.exercise_name, exercise_category: category)
        create(:training_schedule, training_plan: training_plan, exercise: exercise)
      end
    end
  end
end
