class ParfumMaterialsForRecipe < ApplicationRecord
  
  def material
    ParfumMaterial.find_by(id: self.material_id)
  end

  

end