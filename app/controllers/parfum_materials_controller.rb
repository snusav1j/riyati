class ParfumMaterialsController < ApplicationController
  include ApplicationHelper
  before_action :ensure_current_user
  
  def create
    @created = @parfum_material = ParfumMaterial.create(parfum_materials_params)
    
    respond_to :js
  end

  def parfum_materials_used_in
    @id = params[:id]
    @parfum_material = ParfumMaterial.find_by(id: @id)
    respond_to :js
  end

  def filter
    @material_name = parfum_materials_filter_params[:material_name]
    @archive = parfum_materials_filter_params[:archive].to_i == 1
    @liquid_material = parfum_materials_filter_params[:liquid_material].to_i == 1
    @not_liquid_material = parfum_materials_filter_params[:not_liquid_material].to_i == 1

    @parfum_materials = ParfumMaterial.filter(@material_name, @liquid_material, @not_liquid_material, @archive)
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
    params.expect(parfum_material: [ :id, :material_name, :material_ml, :expense, :liquid_material, :material_count, :archive ])
  end
  
  def parfum_materials_filter_params
    params.expect(parfum_material_filter: [ :material_name, :archive, :liquid_material, :not_liquid_material ])
  end

end