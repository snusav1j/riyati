class ParfumMaterialsForRecipe < ApplicationRecord
  # belongs_to :parfum_material

  def material
    ParfumMaterial.find_by(id: self.material_id)
  end

  def recipe
    ParfumRecipe.find_by(id: self.parfum_recipe_id)
  end

  def self.get_parfum_materials
    result = []
    self.all.each do |pmfr|

    end
  end
end