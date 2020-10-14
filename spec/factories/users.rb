FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end