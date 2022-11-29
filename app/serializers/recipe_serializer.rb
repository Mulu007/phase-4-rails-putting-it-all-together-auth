class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :minutes_to_complete
  # sticks the user info for whoever made the recipe
  has_one :user
end
