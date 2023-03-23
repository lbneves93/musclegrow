# frozen_string_literal: true

FactoryBot.define do
  factory :exercise do
    name { ['Bench press', 'Squat', 'Barbell bicep curls'].sample }
    img_url { 'myimg.com/exercise.jpg' }
  end
end
