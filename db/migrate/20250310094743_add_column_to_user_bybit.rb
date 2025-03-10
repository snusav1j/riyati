class AddColumnToUserBybit < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :api, :string
    add_column :users, :s_key, :string
  end
end
