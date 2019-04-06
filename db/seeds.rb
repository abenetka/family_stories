Family.destroy_all
UserFamily.destroy_all
User.destroy_all
Story.destroy_all
Recipe.destroy_all


family_1 = Family.create!(name: "Family 1")
family_2 = Family.create!(name: "Family 2")
family_3 = Family.create!(name: "Family 3")

user_1 = User.create!(name: "User 1", email: "user1@email.com")
user_2 = User.create!(name: "User 2", email: "user2@email.com")

user_family_1 = UserFamily.create!(user: user_1, family: family_1)
user_family_2 = UserFamily.create!(user: user_1, family: family_2)

story_1 = Story.create!(title: "Story 1", content: "Story Content 1", author: "Story Author 1", family: family_1)
story_2 = Story.create!(title: "Story 2", content: "Story Content 2", author: "Story Author 2", family: family_1)
story_3 = Story.create!(title: "Story 3", content: "Story Content 3", author: "Story Author 3", family: family_1)
story_4 = Story.create!(title: "Story 4", content: "Story Content 4", author: "Story Author 4", family: family_1)
story_5 = Story.create!(title: "Story 5", content: "Story Content 5", author: "Story Author 5", family: family_1)
story_6 = Story.create!(title: "Story 6", content: "Story Content 6", author: "Story Author 6", family: family_2)
story_7 = Story.create!(title: "Story 7", content: "Story Content 7", author: "Story Author 7", family: family_2)
story_8 = Story.create!(title: "Story 8", content: "Story Content 8", author: "Story Author 8", family: family_2)
story_9 = Story.create!(title: "Story 9", content: "Story Content 9", author: "Story Author 9", family: family_2)
story_10 = Story.create!(title: "Story 10", content: "Story Content 10", author: "Story Author 10", family: family_2)

recipe_1 = Recipe.create!(title: "Recipe 1", ingredients: "Recipe Ingredient 1", instructions: "Recipe Instruction 1", family: family_1)
recipe_2 = Recipe.create!(title: "Recipe 2", ingredients: "Recipe Ingredient 2", instructions: "Recipe Instruction 2", family: family_1)
recipe_3 = Recipe.create!(title: "Recipe 3", ingredients: "Recipe Ingredient 3", instructions: "Recipe Instruction 3", family: family_1)
recipe_4 = Recipe.create!(title: "Recipe 4", ingredients: "Recipe Ingredient 4", instructions: "Recipe Instruction 4", family: family_1)
recipe_5 = Recipe.create!(title: "Recipe 5", ingredients: "Recipe Ingredient 5", instructions: "Recipe Instruction 5", family: family_1)
recipe_6 = Recipe.create!(title: "Recipe 6", ingredients: "Recipe Ingredient 6", instructions: "Recipe Instruction 6", family: family_2)
recipe_7 = Recipe.create!(title: "Recipe 7", ingredients: "Recipe Ingredient 7", instructions: "Recipe Instruction 7", family: family_2)
recipe_8 = Recipe.create!(title: "Recipe 8", ingredients: "Recipe Ingredient 8", instructions: "Recipe Instruction 8", family: family_2)
recipe_9 = Recipe.create!(title: "Recipe 9", ingredients: "Recipe Ingredient 9", instructions: "Recipe Instruction 9", family: family_2)
recipe_10 = Recipe.create!(title: "Recipe 10", ingredients: "Recipe Ingredient 10", instructions: "Recipe Instruction 10", family: family_2)
#
# photo_1 = Photo.new(image_url: "Photo 1", caption: "Photo Caption 1", family: family_1)
# photo_2 = Photo.new(image_url: "Photo 2", caption: "Photo Caption 2", family: family_1)
# photo_3 = Photo.new(image_url: "Photo 3", caption: "Photo Caption 3", family: family_1)
# photo_4 = Photo.new(image_url: "Photo 4", caption: "Photo Caption 4", family: family_1)
# photo_5 = Photo.new(image_url: "Photo 5", caption: "Photo Caption 5", family: family_1)
# photo_6 = Photo.new(image_url: "Photo 6", caption: "Photo Caption 6", family: family_2)
# photo_7 = Photo.new(image_url: "Photo 7", caption: "Photo Caption 7", family: family_2)
# photo_8 = Photo.new(image_url: "Photo 8", caption: "Photo Caption 8", family: family_2)
# photo_9 = Photo.new(image_url: "Photo 9", caption: "Photo Caption 9", family: family_2)
# photo_10 = Photo.new(image_url: "Photo 10", caption: "Photo Caption 10",  family: family_2)
