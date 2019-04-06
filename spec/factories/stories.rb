FactoryBot.define do
  factory :story do
    title { |n| "Story Title #{n}" }
    content { |n| "Story Content #{n}" }
    author { |n| "Story Author #{n}" }
    family
  end
end
