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

  def get_spent_material(material_id)
    material = ParfumMaterial.find_by(id: material_id)
    if material.liquid_material?
      parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: self.id).find_by(material_id: material_id).spent_material_ml
      parfum_used_materials
    else
      parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: self.id).find_by(material_id: material_id).spent_material_count
      parfum_used_materials
    end
    
  end
  
  def get_recipe_expense
    expense = 0
    materials_for_recipe = ParfumRecipe.find_by(id: self.id).parfum_materials_for_recipe
    materials_for_recipe.each do |mfr|
      material = mfr.material
      if material.liquid_material?
        material_ml = material.material_ml.present? ? material.material_ml : 0
        material_expense = material.expense.present? ? material.expense : 0
        if material_expense > 0 && material_ml > 0
          expense_for_one = material_expense / material_ml
          expense += expense_for_one * mfr.spent_material_ml if mfr.spent_material_ml.present?
        end
      else
        material_count = material.material_count.present? ? material.material_count : 0
        material_expense = material.expense.present? ? material.expense : 0
        if material_expense > 0 && material_count > 0
          expense_for_one = material_expense / material_count
          expense += expense_for_one * mfr.spent_material_count if mfr.spent_material_count.present?
        end
      end
    end
    expense.round(2)
  end

end
