class ParfumMaterialsForRecipe < ApplicationRecord
  
  def material
    ParfumMaterial.find_by(id: self.material_id)
  end

  def recipe
    ParfumRecipe.find_by(id: self.parfum_recipe_id)
  end

end