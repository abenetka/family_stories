FactoryBot.define do
  factory :recipe do
    title { |n| "Grandma's Special #{n}"}
    ingredients { |n| "The best ingredients #{n}"}
    instructions { |n| "Add several #{n}"}
    family
  end
end
