class AddColumnToParfum < ActiveRecord::Migration[8.0]
  def change
    add_column :parfums, :parfum_recipe_id, :integer
  end
end
