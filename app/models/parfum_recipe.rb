class ParfumRecipe < ApplicationRecord
  
  def parfum_materials_for_recipe
    ParfumMaterialsForRecipe.where(parfum_recipe_id: self.id)
  end

  def self.parfum_materials_for_recipe_list(parfum_recipe)
    list = []
    parfum_materials_for_recipe = ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe.id)
    ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe.id).each do |pmr|
      list << pmr.material.id if pmr.material.present?
    end
    list
  end

  def self.get_spent_material_ml(material_id)
    parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: self.id).find_by(material_id: material_id).spent_material_ml
    parfum_used_materials
  end

end
