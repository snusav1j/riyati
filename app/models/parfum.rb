class Parfum < ApplicationRecord
  
  def recipe
    ParfumRecipe.find_by(id: self.parfum_recipe_id)
  end

end