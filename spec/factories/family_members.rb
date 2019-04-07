FactoryBot.define do
  factory :family_member do
    name { |n| "Your cousin #{n}"}
    family
  end
end
