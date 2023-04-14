FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { '123456' }
    role { User.roles[:admin] }

    trait :athlete do
      role { User.roles[:athlete] }
    end
  end
end