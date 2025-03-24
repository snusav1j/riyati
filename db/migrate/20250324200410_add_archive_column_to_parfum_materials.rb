class AddArchiveColumnToParfumMaterials < ActiveRecord::Migration[8.0]
  def change
    add_column :parfum_materials, :archive, :boolean
  end
end
