class ParfumRecipesController < ApplicationController

  def create
    @created = @parfum_recipe = ParfumRecipe.create(parfum_recipes_params)
    respond_to :js
  end
  
  def update
    @id = parfum_recipes_params[:id]
    @parfum_recipe = ParfumRecipe.find_by(id: @id)
    @updated = @parfum_recipe.update(parfum_recipes_params)
    respond_to :js
  end

  private

  def parfum_recipes_params
    params.expect(parfum_recipe: [ :id, :parfum_id, :parfum_material_id, :drops_count, :ml ])
  end


end