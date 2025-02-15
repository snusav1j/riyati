class CreateParfum < ActiveRecord::Migration[8.0]
  def change
    create_table :parfums do |t|
      t.string :parfum_name
      t.string :parfum_description
      t.boolean :tester
      t.timestamps
    end
    create_table :parfum_ingridients do |t|
      t.string :ingridient_name
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
