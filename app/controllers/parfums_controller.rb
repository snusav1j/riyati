class ParfumsController < ApplicationController

  def index
    ParfumRecipe.create()
    @parfum = Parfum.all
  end

  def create

  end

  def update

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

  def parfums_params
    params.expect(parfum: [ :id, :parfum_name, :parfum_description, :tester ])
  end

  def parfum_drop_avg_mls_params
    params.expect(parfum_drop_avg_ml: [ :id, :ml ])
  end
  
end
