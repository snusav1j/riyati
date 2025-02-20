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

  def materials_list_for_select(parfum_recipe)
    result = []
    # ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe.id).each do |pmfr|
    #   if pmfr.material.liquid_material?
    #     result << [pmfr.material.material_name, pmfr.material.id] if pmfr.material.liquid_material_mls_left > 0
    #   else
    #     result << [pmfr.material.material_name, pmfr.material.id] if pmfr.material.not_liquid_material_count_left > 0
    #   end
    # end
    ParfumMaterial.all.each do |material|
      material_for_recipe_present = ParfumMaterialsForRecipe.where(parfum_recipe_id: parfum_recipe.id).find_by(material_id: material.id)
      if material.liquid_material?
        result << [material.material_name, material.id] if material.liquid_material_mls_left > 0 || material_for_recipe_present.present?
      else
        result << [material.material_name, material.id] if material.not_liquid_material_count_left > 0 || material_for_recipe_present.present?
      end
    end

    result
  end

end