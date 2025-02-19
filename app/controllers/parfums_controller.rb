class ParfumsController < ApplicationController
  before_action :ensure_current_user
  before_action :create_parfum_drop_avg

  def index
    # Parfum.delete_all
    # ParfumMaterial.delete_all
    # ParfumRecipe.delete_all
    # ParfumMaterialsForRecipe.delete_all
    @parfums = Parfum.all
  end

  def refresh_parfum_recipe_modal_data
    @parfum_materials_for_recipe_list = []
    @parfum_recipe = ParfumRecipe.new
    @url = params[:url]
  end

  def create
    @created = @parfum = Parfum.create(parfums_params)
    respond_to :js
  end

  def update
    @id = parfums_params[:id]
    @parfum = Parfum.find_by(id: @id)
    @updated = @parfum.update(parfums_params)
    respond_to :js
  end

  def calc_ml_modal

    respond_to :js
  end

  def delete_parfum
    @id = params[:id]
    @parfum = Parfum.find_by(id: @id)
    @deleted = @parfum.delete
    respond_to :js
  end

  def parfum_materials
    @parfum_materials = ParfumMaterial.all
  end

  def parfum_recipes
    @parfum_recipes = ParfumRecipe.all
  end

  def parfum_drop_avg_mls
    @parfum_drop_avg_mls = ParfumDropAvgMl.all
  end

  def new_parfum_modal
    @parfum = Parfum.new()
    @parfum_recipe_id = params[:parfum_recipe_id]
    respond_to :js
  end

  def edit_parfum_modal
    @id = params[:id]
    @parfum_recipe_id = params[:parfum_recipe_id]
    @parfum = Parfum.find_by(id: @id)
    respond_to :js
  end

  def new_parfum_materials_modal
    @parfum_material = ParfumMaterial.new
    respond_to :js
  end

  def edit_parfum_materials_modal
    @id = params[:id]
    @parfum_material = ParfumMaterial.find_by(id: @id)
    respond_to :js
  end

  def new_parfum_recipes_modal
    @parfum_materials_for_recipe_list = []
    @parfum_recipe = ParfumRecipe.new
    respond_to :js
  end

  def edit_parfum_recipes_modal
    @id = params[:id]
    @parfum_recipe = ParfumRecipe.find_by(id: @id)
    @parfum_materials_for_recipe_list = ParfumRecipe.parfum_materials_for_recipe_list(@parfum_recipe)
    respond_to :js
  end

  def show

  end

  private

  def create_parfum_drop_avg
    if !ParfumDropAvgMl.first.present?
      ParfumDropAvgMl.create(ml: 0)
    end
  end

  def parfums_params
    params.expect(parfum: [ :id, :parfum_name, :parfum_description, :tester, :parfum_recipe_id ])
  end

  def parfum_drop_avg_mls_params
    params.expect(parfum_drop_avg_ml: [ :id, :ml ])
  end
  
end
