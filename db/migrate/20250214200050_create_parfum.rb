class CreateParfum < ActiveRecord::Migration[8.0]
  def change
    create_table :parfums do |t|
      t.string :parfum_name
      t.string :parfum_description
      t.boolean :tester
      t.timestamps
    end
    create_table :parfum_materials do |t|
      t.string :material_name
      t.float :material_ml
      t.float :expense
      t.timestamps
    end
    create_table :parfum_recipes do |t|
      t.integer :parfum_id
      t.integer :parfum_material_id
      t.integer :drops_count
      t.float :ml
      t.timestamps
    end
    create_table :parfum_drop_avg_mls do |t|
      t.float :ml
      t.timestamps
    end
  end
end
