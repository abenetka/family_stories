class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :ingredients, :instructions

  belongs_to :family
end
