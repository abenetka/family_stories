FactoryBot.define do
  factory :photo do
    image_url { |n| "my_url #{n}"}
    caption { |n| "Mildred & 'Red' Spring 1947 #{n}"}
    family
  end
end
