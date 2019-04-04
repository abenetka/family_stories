FactoryBot.define do
  factory :user do
    name { |n| "Person #{n}" }
    email { |n| "person#{n}@aol.com" }
  end
end
