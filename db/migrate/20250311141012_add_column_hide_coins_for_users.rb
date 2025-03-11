class AddColumnHideCoinsForUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :hide_crypto_info, :boolean
  end
end
