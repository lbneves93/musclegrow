# frozen_string_literal: true

FactoryBot.define do
  factory :exercise_category do
    name { %w[Chest Leg Biceps Triceps Shoulder Back Abs Aerobic].sample }
    img_url { 'https://www.muscle.com/chest.jpg' }
  end
end
