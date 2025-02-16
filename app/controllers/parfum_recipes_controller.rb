class ParfumRecipesController < ApplicationController

  def create
    @parfum_materials = params[:parfum_recipe][:parfum_material_id]
    @params = params
    @created = @parfum_recipe = ParfumRecipe.create(parfum_recipes_params)
    @drops_count = params[:parfum_recipe][:drops_count]
    if @created
      @parfum_materials.each do |pm|
        ParfumMaterialsForRecipe.create(material_id: pm, parfum_recipe_id: @parfum_recipe.id) if pm.present?
      end
      @drops_count.each do |dc|
        parfum_material_id = dc[0]
        spent_material_ml = dc[1]
        ParfumMaterialsForRecipe.where(parfum_recipe_id: @parfum_recipe.id).find_by(material_id: parfum_material_id).update(spent_material_ml: spent_material_ml)
      end
    end
    respond_to :js
  end
  
  def update
    @id = parfum_recipes_params[:id]
    @parfum_recipe = ParfumRecipe.find_by(id: @id)
    @parfum_materials = params[:parfum_recipe][:parfum_material_id]
    @updated = @parfum_recipe.update(parfum_recipes_params)

    @drops_count = params[:parfum_recipe][:drops_count]

    if @updated
      ParfumMaterialsForRecipe.where(parfum_recipe_id: @parfum_recipe.id).delete_all
      @parfum_materials.each do |pm|
        ParfumMaterialsForRecipe.create(material_id: pm, parfum_recipe_id: @parfum_recipe.id) if pm.present?
      end
      @drops_count.each do |dc|
        parfum_material_id = dc[0]
        spent_material_ml = dc[1]
        ParfumMaterialsForRecipe.where(parfum_recipe_id: @parfum_recipe.id).find_by(material_id: parfum_material_id).update(spent_material_ml: spent_material_ml)
      end
    end


    respond_to :js
  end

  def delete_parfum_recipes
    @id = params[:id]
    @parfum_recipe = ParfumRecipe.find_by(id: @id)
    @deleted = @parfum_recipe.delete
    if @deleted
      ParfumMaterialsForRecipe.where(parfum_recipe_id: @id).delete_all
    end
  end

  private

  def parfum_recipes_params
    params.expect(parfum_recipe: [ :id, :parfum_id, :drops_count, :ml ])
  end


end