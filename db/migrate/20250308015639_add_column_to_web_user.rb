class AddColumnToWebUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tg_chat_id, :string
  end
end
