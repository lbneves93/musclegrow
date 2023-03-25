FactoryBot.define do
  factory :exercise_category do
    name { ['Chest', 'Leg', 'Biceps', 'Triceps', 'Shoulder', 'Back', 'Abs', 'Aerobic'].sample }
    img_url { 'www.muscle.com/chest.jpg' }
  end
end
