class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :author
  belongs_to :family
end
