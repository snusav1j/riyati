module ParfumsHelper

  def get_spent_material(parfum_recipe_id=nil, material_id=nil)
    parfum_material = ParfumMaterial.find_by(id: material_id)

    if parfum_material.liquid_material?
      parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe_id).find_by(material_id: material_id).spent_material_ml
      return parfum_used_materials
    else
      parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe_id).find_by(material_id: material_id).spent_material_count
      return parfum_used_materials
    end
  end

  def one_drop_ml_title
    ml = ParfumDropAvgMl.first.present? ? ParfumDropAvgMl.first.ml : 0
    "1 капля ~#{ml} мл."
  end

  def one_drop_ml
    ml = ParfumDropAvgMl.first.present? ? ParfumDropAvgMl.first.ml : 0
    ml
  end

end