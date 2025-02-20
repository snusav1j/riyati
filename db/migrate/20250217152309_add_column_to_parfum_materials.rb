class AddColumnToParfumMaterials < ActiveRecord::Migration[8.0]
  def change
    add_column :parfum_materials, :liquid_material, :boolean
    add_column :parfum_materials, :material_count, :integer
    add_column :parfum_materials_for_recipes, :spent_material_count, :integer
  end
end
