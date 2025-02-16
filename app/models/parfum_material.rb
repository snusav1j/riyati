class ParfumMaterial < ApplicationRecord
  # belongs_to :parfum_recipe
  
  def get_total_spent_material_ml
    spent_material_ml = 0
    parfum_used_materials = ParfumMaterialsForRecipe.where(material_id: self.id)
    parfum_used_materials.each do |pum|
      spent_material_ml += pum.spent_material_ml if pum.spent_material_ml.present?
    end
    spent_material_ml.round(2)
  end

  
end