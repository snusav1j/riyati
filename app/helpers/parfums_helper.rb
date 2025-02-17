module ParfumsHelper

  def get_spent_material_ml(parfum_recipe_id=nil, material_id=nil)
    parfum_used_materials = ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe_id).find_by(material_id: material_id).spent_material_ml
    parfum_used_materials
  end

  def one_drop_ml
    "1 капля ~ #{ParfumDropAvgMl.first.ml} мл."
  end

end