# frozen_string_literal: true

FactoryBot.define do
  details = %w[Ruby Rails React Javascript]
  factory :course, class: Course do
    author { Faker::ProgrammingLanguage.creator }
    detail { details.sample }
    duration { '2 Hours' }
  end
end

FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :favourite, class: Favourite do
    course
    user
  end
end
