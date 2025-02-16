class CreateParfumMaterialsForRecipe < ActiveRecord::Migration[8.0]
  def change
    create_table :parfum_materials_for_recipes do |t|
      t.timestamps
      t.integer :material_id
      t.float :spent_material_ml
      t.integer :parfum_recipe_id
    end
  end
end
