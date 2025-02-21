class ParfumMaterial < ApplicationRecord
  # has_many :parfum_materials_for_recipes
  
  scope :liquid_material, ->{ where("liquid_material = ?", true) }
  scope :not_liquid_material, -> { where("liquid_material = ?", false) }

  def materials_used_in
    ParfumMaterialsForRecipe.where(material_id: self.id)
  end

  def get_total_spent_liquid_material_ml
    spent_material_ml = 0
    parfum_used_materials = ParfumMaterialsForRecipe.where(material_id: self.id)
    parfum_used_materials.each do |pum|
      spent_material_ml += pum.spent_material_ml if pum.spent_material_ml.present?
    end
    spent_material_ml.round(2)
  end

  def liquid_material?
    self.liquid_material == true
  end

  def get_total_spent_not_liquid_material_count
    spent_material_count = 0
    parfum_used_materials = ParfumMaterialsForRecipe.where(material_id: self.id)
    parfum_used_materials.each do |pum|
      spent_material_count += pum.spent_material_count if pum.spent_material_count.present?
    end
    spent_material_count.round(2)
  end

  def self.get_materials
    result = []
    self.all.each do |pm|
      if pm.liquid_material?
        material_ml = pm.material_ml.present? ? pm.material_ml : 0
        result << pm if (material_ml - pm.get_total_spent_liquid_material_ml) > 0
      else
        material_count = pm.material_count.present? ? pm.material_count : 0
        result << pm if (material_count - pm.get_total_spent_not_liquid_material_count) > 0
      end
    end
    result
  end
  
  def liquid_material_mls_left
    if self.present?
      material_ml = self.material_ml.present? ? self.material_ml : 0
      return (material_ml - self.get_total_spent_liquid_material_ml).round(2)
    else
      return '?'
    end
  end
  
  def not_liquid_material_count_left
    if self.present?
      material_count = self.material_count.present? ? self.material_count : 0
      return (material_count - self.get_total_spent_not_liquid_material_count).round(2)
    else
      return '?'
    end
  end

  def one_material_cost
    if (self.expense && self.material_count) || (self.expense && self.material_ml)
      if self.liquid_material?
        (self.expense / self.material_ml).round(2)
      else
        (self.expense / self.material_count).round(2)
      end
    end
  end

end