class ParfumMaterialsController < ApplicationController
  before_action :ensure_current_user
  def create
    @created = @parfum_material = ParfumMaterial.create(parfum_materials_params)
    respond_to :js
  end
  
  def update
    @id = parfum_materials_params[:id]
    @parfum_material = ParfumMaterial.find_by(id: @id)
    @updated = @parfum_material.update(parfum_materials_params)
    respond_to :js
  end

  def delete_parfum_materials
    @id = params[:id]
    @parfum_material = ParfumMaterial.find_by(id: @id)
    @deleted = @parfum_material.delete
    if @deleted
      ParfumMaterialsForRecipe.where(material_id: @id).delete_all
    end
    respond_to :js
  end

  private
  
  def parfum_materials_params
    params.expect(parfum_material: [ :id, :material_name, :material_ml, :expense, :liquid_material, :material_count ])
  end

end